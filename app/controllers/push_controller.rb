class PushController < ApplicationController

	def create

		# save the raw data to the log table
		log = PushLog.new
		log.data = params[:payload]
		log.save!

		# also save this to redis so any client can pick it up
		uri = URI.parse(ENV["REDISTOGO_URL"])
		REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
		REDIS.lpush("incoming",params[:payload])
	end

	def index

	end
	
end
