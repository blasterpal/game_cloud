module Ec2GameServer

  def initialize(config=CONFIG)
    @compute = Fog::Compute.new({:provider => 'AWS', :aws_access_key_id => config['aws']['access_key'], :aws_secret_access_key => config['aws']['secret_access_key']})
    @storage = Fog::Storage.new({:provider => 'AWS', :aws_access_key_id => config['aws']['access_key'], :aws_secret_access_key => config['aws']['secret_access_key']})
  end
  
  def server
    compute.servers.get(id)
  end

  def status
    server.state
  end

  def start
    server.start
  end

  def stop
    server.stop
  end

end
