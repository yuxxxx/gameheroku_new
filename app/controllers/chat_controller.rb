require "date"
require "active_support"
class ChatController < ApplicationController
	def reader
		latest=Chatlog.find(:last, :conditions => { :place => params[:room_prm] })
		if (latest!=nil)&&(DateTime.now-30.minute > latest.spoken_time) then
			Chatlog.find_all_by_place(params[:room_prm]).each do |log|
				log.destroy
			end
		end
		@chatlog_local=Chatlog.find_all_by_place(params[:room_prm])
	end
	def writer
		writetemp=Chatlog.new
		writer_data=Visitor.find_by_ip(request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip)
		writetemp.name=writer_data.name
		writetemp.content=params[:content_prm]
		writetemp.place=params[:room_prm]
		writetemp.spoken_time=DateTime.now
		lastlog=Chatlog.last
		if (lastlog==nil)||(!((lastlog.name==writetemp.name)&&(lastlog.content==writetemp.content)&&(lastlog.place==writetemp.place))) then
			writetemp.save
		end
		#render :nothing =>true
		#render :partial => "partial/chatwrite_form",:locals => {:room_local => params[:room_prm]}
	end
end
