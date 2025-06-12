require 'socket'
require_relative './lib/http_req'
require_relative './lib/http_res'
require_relative './lib/router'
require_relative './lib/logger'

server = TCPServer.new('localhost', 3000)
puts "Listening on port 3000..."

loop do
  client = server.accept

  Thread.new do
    begin
      request_line = client.gets
      next if request_line.nil? || request_line.empty?

      request = HTTPRequest.new(request_line)
      Logger.log_request(request)

      response = Router.route(request)
      client.print response.build

      rescue => e
        Logger.log_error(e)
        error_response = HTTPResponse.new(500, "Internal Server Error")
        client.print error_response.build
    ensure
      client.close
    end
  end
end

