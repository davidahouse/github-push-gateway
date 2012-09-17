class PushController < ApplicationController

	def new

		# save the raw data to the log table
		log = PostLog.new
		log.data = params[:payload]
		log.save!

		# also save this to redis so any client can pick it up

	end
	
end
