module Provision
  @queue = :provision

  def perform(server)
    server.provision
  end
end
