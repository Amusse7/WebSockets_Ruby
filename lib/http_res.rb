
class HTTPResponse
  def initialize(status_code, body, content_type = 'text/html')
    @status_code = status_code
    @body = body
    @content_type = content_type
  end

  def build
    status_message = {
      200 => 'OK',
      404 => 'Not Found'
    }[@status_code]

    "HTTP/1.1 #{@status_code} #{status_message}\r\n" \
      "Content-Type: #{@content_type}\r\n" \
      "Content-Length: #{@body.bytesize}\r\n" \
      "Connection: close\r\n" \
      "\r\n" \
      "#{@body}"
  end
end