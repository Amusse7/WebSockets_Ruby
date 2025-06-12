require_relative './http_res'
require 'json'

class Router
  def self.route(request)
    case request.path
    when '/'
      serve_file('index.html')
    when '/about'
      serve_file('about.html')
    when '/api/time'
      serve_json({time: Time.now})
    else
      serve_file('404.html', 404)
    end
  end

  def self.serve_file(file_name, status = 200)
    path = File.join('public', file_name)
    if File.exist?(path)
      body = File.read(path)
      HTTPResponse.new(status, body)
    else
      HTTPResponse.new(404, 'File not found')
    end
  end

  def self.serve_json(data)
    json_body = data.to_json
    HTTPResponse.new(200, json_body, 'application/json')
  end
end