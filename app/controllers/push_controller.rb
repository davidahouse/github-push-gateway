class PushController < ApplicationController

	def create

		# save the raw data to the log table
		log = PushLog.new
		log.data = params[:payload]
		log.save!

		# also save this to redis so any client can pick it up

	end

	def index

	end
	
end
