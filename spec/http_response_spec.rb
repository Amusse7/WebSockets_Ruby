require_relative '../lib/http_res'

RSpec.describe HTTPResponse do
  it "builds a valid HTTP 200 response" do
    response = HTTPResponse.new(200, "Hello World")
    output = response.build

    expect(output).to include("HTTP/1.1 200 OK")
    expect(output).to include("Content-Type: text/html")
    expect(output).to include("Hello World")
  end

  it "builds a valid HTTP 404 response" do
    response = HTTPResponse.new(404, "Not Found")
    output = response.build

    expect(output).to include("HTTP/1.1 404 Not Found")
  end
end
