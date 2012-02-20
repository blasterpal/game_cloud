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

  def public_ip
    server.public_ip_address
  end

  def private_ip
    server.private_ip_address
  end


  private

  def get_new_ip_address
    compute.allocate_address.public_ip
    compute.associate_address(id,compute.addresses.first.public_ip)
  end

  def release_all_ip_addresses
    compute.addresses.each do |ip|
      compute.release_address(ip.public_ip)
    end
  end

end
