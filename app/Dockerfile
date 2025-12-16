FROM ruby:3.3

WORKDIR /app
COPY Gemfile Gemfile.lock* ./
RUN bundle install

COPY reproduce.rb ./
COPY patch_reproduce.rb ./
COPY config/mongoid.yml ./config/mongoid.yml

CMD ["ruby", "reproduce.rb"]
