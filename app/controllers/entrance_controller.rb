require "date"
class EntranceController < ApplicationController
	def enter
	end
	def namewriter
		visitor_name=params[:name_prm]
		cliant_ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
		visitor=Visitor.find_by_ip(cliant_ip) 
		if visitor==nil then visitor=Visitor.new end
		visitor.name=visitor_name
		visitor.lasttime=DateTime.now
		visitor.ip = cliant_ip
		visitor.save
	end
end
