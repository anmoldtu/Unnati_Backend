class UsersController < ApplicationController
	before_action :authenticate_user!, :except => [:profile]

	def dashboard
		@time=Time.new
		if(current_user.bio.blank?)
			return redirect_to action: 'add_bio'
		end
		@userbio=current_user.bio
		if((@userbio.expirytime-@time)<=0)
			return redirect_to action: 'acc_lock'
		end	
		current_date=@time.day.to_s + "/" + @time.month.to_s + "/" + @time.year.to_s
		@userstatus=Attendanceadmin.where(user_name:@userbio.name, status: 1, date:current_date,area:@userbio.area)
		if(@userstatus.blank?)
			Attendanceadmin.create(user_name:@userbio.name, status: 1, date:current_date,area:@userbio.area)
		end
		@mods=Mod.where(course_id:@userbio.course_id)
	end

	def add_bio
		@courses=Course.all
	end	

	def bio_create
		@course=Course.find(params[:course])
		time=Time.new
		time=time
		Bio.create(user_id:current_user.id,course_id:params[:course],area:params[:area],name:params[:name],fees:0,expirytime:time)
		redirect_to action: 'dashboard'
	end	

	def Assignment
		@results=Result.where(user_id:current_user.id,mod_id:params[:id])
		if(!@results.blank?)
			return redirect_to action:'result_show',uid:current_user.id,mid:params[:id] 
		end	 
		@questions=Question.where(mod_id: params[:id])
	end

	def result_create
		q=Question.where(mod_id: params[:mod_id]).length
		count=0
		for i in 1..q
			quesFind=Question.find(params["ques_id-#{i}".to_sym])
			if(quesFind.answer==params["ques-#{i}".to_sym])
				corr=1
				count=count+1
			else
				corr=0
			end		
			modname=Mod.find(params[:mod_id]).name
			Result.create(user_id: current_user.id, question_id: params["ques_id-#{i}".to_sym], mod_id: params[:mod_id], ans_marked: params["ques-#{i}".to_sym],correct: corr)
		end
			wa=q-count
			Report.create(user_id: current_user.id, mod_id: params[:mod_id],correctans: count,wrongans:wa,modname: modname)
		redirect_to action: 'result_show',uid:current_user.id,mid:params[:mod_id] 

	end	

	def result_show
		@results=Result.where(user_id:params[:uid],mod_id:params[:mid])
		if(@results.blank?)
			redirect_to action: 'dashboard'
		end	
		@questions=Question.where(mod_id: params[:mid])
		@correctAns=Result.where(user_id:params[:uid],mod_id:params[:mid],correct: 1).length
	end	

	def video
		@mod=Mod.find(params[:id])
	end

	def acc_lock
	end	

	def profile
		user=User.find(params[:id])
		@userbio=user.bio
		@reports=Report.where(user_id:params[:id])
		@modlength=Mod.where(course_id:@userbio.course_id).length
		@type="user"
		if(current_user.blank?)
			@type="entre"
		end
	end	
end
