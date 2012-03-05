module HomeHelper

  def refresh_page
    'Wait a moment and refresh page.'
  end

  def server_status
    @server.status.upcase
  end
end
