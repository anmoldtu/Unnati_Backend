class EntresController < ApplicationController
	before_action :authenticate_entre!

	def dashboard
		if(current_entre.entrebio.blank?)
			return redirect_to action: 'add_entrebio'
		end
		@entrebio=current_entre.entrebio
		@time=Time.new
		@current_date=@time.day.to_s + "/" + @time.month.to_s + "/" + @time.year.to_s
		# @attendance=Attendanceentre.where(status:1,date:current_date,area:@userbio.area)
		@users=Bio.where(area:@entrebio.area)
	end

	def add_entrebio
	
	end

	def entrebio_create
		Entrebio.create(entre_id:current_entre.id,area:params[:area],name:params[:name],money:0)
		redirect_to action: 'dashboard'
	end	


	def attend_create
		@time=Time.new
		current_date=@time.day.to_s + "/" + @time.month.to_s + "/" + @time.year.to_s
		@userbio=User.find(params[:id]).bio
		Attendanceentre.create(user_name:@userbio.name,user_id:params[:id],status:1,date:current_date,area:@userbio.area)
		redirect_to action: 'dashboard'
	end

	def attend_destroy
		@time=Time.new
		current_date=@time.day.to_s + "/" + @time.month.to_s + "/" + @time.year.to_s
		@userbio=User.find(params[:id]).bio
		a=Attendanceentre.where(user_id:params[:id],status:1,date:current_date,area:@userbio.area).first
		a.delete
		redirect_to action: 'dashboard'
	end	

	def add_money
		@entrebio=current_entre.entrebio
		@users=Bio.where(area:@entrebio.area)
	end	

	def fees_deposit
		bio=Bio.find_by(user_id:params[:user])
		biofees=bio.fees+params[:fees].to_i
		bio.fees=biofees
		time=bio.expirytime+((6.to_f/20)*params[:fees].to_i)*(60*24*60)
		bio.expirytime=time
		bio.save
		redirect_to action: 'dashboard'
	end
end	