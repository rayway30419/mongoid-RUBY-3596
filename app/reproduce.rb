# frozen_string_literal: true

require "mongoid"
require "logger"

Mongo::Logger.logger = Logger.new($stdout)
Mongo::Logger.logger.level = Logger::INFO

env = ENV.fetch("MONGOID_ENV", "development")
Mongoid.load!("./config/mongoid.yml", env)

client = Mongoid::Clients.default

puts "[Initialing] servers (size=#{client.cluster.servers.size})"
sleep 5
puts "[After 5s] servers (size=#{client.cluster.servers.size})"

client.close
