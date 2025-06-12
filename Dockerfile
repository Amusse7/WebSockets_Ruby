FROM ruby:3.2

WORKDIR /app

COPY . .

RUN bundle install || true

EXPOSE 3000

CMD ["ruby", "server.rb"]
