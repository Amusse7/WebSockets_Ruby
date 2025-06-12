class HTTPRequest
  attr_accessor :method, :path

  def initialize(request_line)
    parts = request_line.split
    @method = parts[0]
    @path = parts[1]
  end
end