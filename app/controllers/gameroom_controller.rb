class GameroomController < ApplicationController
	def top
		cliant_ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
		mydata=Visitor.find_by_ip(cliant_ip) 
		mydata.place=params[:room_prm]
		mydata.save
		@roomname=params[:room_prm]
	end
	def room_visitorlist
		cliant_ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
		mydata=Visitor.find_by_ip(cliant_ip)
		mydata.lasttime=DateTime.now
		mydata.save
		Visitor.all.each{ |visitor|
			if DateTime.now-30.second > visitor.lasttime then 
				visitor.destroy
			end
		}
		@Visitorlist_local=Visitor.find_all_by_place(params[:room_prm])
	end
	def room_creater
		@exist_flag=true
		@roomname=params[:room_prm]
		if (@roomname!="lobby")&&(Roomdata.find_by_place(@roomname)==nil) then
			newroom=Roomdata.new
			newroom.place=@roomname
			newroom.dataname="exist"
			newroom.save
			@exist_flag=false
		end
		respond_to do |format|
			format.js
		end
	end
			
	def room_destroyer
		used_placelist=Array.new
		exist_placelist=Array.new
		Visitor.all.each do |visitor|
			used_placelist.push(visitor.place)
		end
		Roomdata.all.each do |data|
			exist_placelist.push(data.place)
		end
		used_placelist.uniq!
		exist_placelist.uniq!
		exist_placelist.each do |exist_place|
			if used_placelist.find(exist_place)==nil then
				Roomdata.find_all_by_place(exist_place).each do |data|
					data.destroy
				end
			end
		end
	render :nothing => true
	end
end