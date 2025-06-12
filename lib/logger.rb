class Logger
  LOG_FILE = 'logs/server.log'

  def self.log_request(request)
    File.open(LOG_FILE, 'a') do |file|
      file.puts("[#{Time.now}] #{request.method} #{request.path}")
    end
  end

  def self.log_error(error)
    File.open(LOG_FILE, 'a') do |file|
      file.puts("[#{Time.now}] ERROR: #{error.message}")
      file.puts(error.backtrace)
    end
  end
end
