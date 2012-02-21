class HomeController < ApplicationController
  http_basic_authenticate_with :name => "blasterpal", :password => "zanjonah!!", :except =>  :status
  before_filter :init_server

  def admin 
    render :action => 'admin'
  end
  
  def start
    @server.start
    redirect_to :action => 'admin'
  end

  def stop
    @server.stop
    redirect_to :action => 'admin'
  end

  def status
    
  end
 
 private  
  def init_server
    @server = GameServer.new
  end
end
