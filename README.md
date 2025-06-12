#  🏆🏆  Mini HTTP Server In Ruby

A fully functional HTTP server built entirely in Ruby using raw sockets, multithreading, and custom HTTP parsing.

## 🚀🚀 Features

- Raw TCP socket server
- HTTP GET request parsing
- Routing system
- Serve static files & JSON APIs
- Multithreaded request handling
- Error logging
- RSpec test suite
- Dockerized for portability

##  🛠 Running Locally

```bash
ruby server.rb
```

## 📦 🐳  Or via Docker:

```bash
docker build -t mini_http_server .
docker run -p 3000:3000 mini_http_server
```

## 📝 🧪 Running Tests

```bash
bundle exec rspec

```