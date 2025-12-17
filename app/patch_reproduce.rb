require "mongoid"
require "logger"# frozen_string_literal: true

module MongoSrvMonitorPatch
  private

  def scan!
    begin
      last_result = Timeout.timeout(timeout) do
        result = @resolver.get_records(
          @srv_uri.query_hostname,
          @srv_uri.uri_options[:srv_service_name],
          @srv_uri.uri_options[:srv_max_hosts]
        )
      end
    rescue Resolv::ResolvTimeout => e
      log_warn("SRV monitor: timed out trying to resolve hostname #{@srv_uri.query_hostname}: #{e.class}: #{e}")
      return
    rescue ::Timeout::Error
      log_warn("SRV monitor: timed out trying to resolve hostname #{@srv_uri.query_hostname} (timeout=#{timeout})")
      return
    rescue Resolv::ResolvError => e
      log_warn("SRV monitor: unable to resolve hostname #{@srv_uri.query_hostname}: #{e.class}: #{e}")
      return
    end
  end
end

Mongo::Srv::Monitor.prepend(MongoSrvMonitorPatch)

Mongo::Logger.logger = Logger.new($stdout)
Mongo::Logger.logger.level = Logger::INFO

env = ENV.fetch("MONGOID_ENV", "development")
Mongoid.load!("./config/mongoid.yml", env)

client = Mongoid::Clients.default

puts "[Initialing] servers (size=#{client.cluster.servers.size})"
sleep 5
puts "[After 5s] servers (size=#{client.cluster.servers.size})"

client.close
