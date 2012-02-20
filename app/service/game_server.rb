require 'fog'

class GameServer

  include Ec2GameServer
  
  def config
    CONFIG['game_server']
  end

  def compute
    @compute
  end

  def storage
    @storage
  end
  
  def id
   config['id']
  end

end
