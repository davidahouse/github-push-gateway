require 'rubygems'
require 'redis'
require 'uri'
require 'pp'
require 'net/http'

puts "connecting to redis..."
#uri = URI.parse("redis://redistogo:826b08473244ef80d3c11447f946a7c3@fish.redistogo.com:9203/")
uri = URI.parse(ENV['JCG_REDIS_URI'])
r = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

jenkins_uri = URI.parse(ENV['JCG_JENKINS_URI'])

while true
	log = r.lpop("incoming")
	if log
		pp log
		response = Net::HTTP.post_form(jenkins_uri,log)
	end
	sleep 5
end

