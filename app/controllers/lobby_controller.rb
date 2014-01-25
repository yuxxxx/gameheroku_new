require "date"
require "active_support"

class LobbyController < ApplicationController
	def top
		cliant_ip=request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
		mydata=Visitor.find_by_ip(cliant_ip)
		mydata.place="lobby"
		mydata.save
		@chat_location="lobby"
	end
	def visitor_update
		@visitorlist_local=Visitor.all
		cliant_ip=request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
		mydata=Visitor.find_by_ip(cliant_ip)
		mydata.lasttime=DateTime.now
		mydata.save

		Visitor.all.each{ |visitor|
			if DateTime.now-30.second > visitor.lasttime then 
				visitor.destroy
			end
		}

	end
end
