load './lib/tasks/tools.rake'
require 'colorize'

namespace :watch_v2 do
  desc 'run watchdoge service on API Entreprise v2'
  task 'all', [:period] => :environment do |t, args|
    puts 'V2'.green unless ENV['RAILS_ENV'] = 'test'

    env_info

    hash_options = args.to_h

    service = PingAPIEOnV2.new(hash_options)
    service.perform do |ping, endpoint|
      request_url = service.send(:request_url, endpoint)
      print_ping(ping, request_url)
    end
  end

  desc 'run watchdoge on a specific service on API Entreprise v2: rake apie_v2:one associations'
  task 'one': :environment do
    env_info

    # rubocop:disable Style/BlockDelimiters
    ARGV.each { |a| task a.to_sym do; end } # it removes exit exception

    endpoint_name = ARGV[1]
    raise 'Need an argument! ie: `rake apie_v2:one associations`'.red if endpoint_name.nil?

    endpoint = Tools::EndpointFactory.new('apie').create(endpoint_name, 2)
    raise "#{endpoint_name} not found in endpoints.yml (and custom classes)".red if endpoint.nil?

    service = PingAPIEOnV2.new
    request_url = service.send(:request_url, endpoint)
    ping = service.perform_ping(endpoint)

    print_ping(ping, request_url)
  end
end
