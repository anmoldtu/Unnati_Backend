class UsersController < ApplicationController
	before_action :authenticate_user!
	def dashboard
		@mods=Mod.all
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
		for i in 1..q
			quesFind=Question.find(params["ques_id-#{i}".to_sym])
			if(quesFind.answer==params["ques-#{i}".to_sym])
				corr=1
			else
				corr=0
			end		

			Result.create(user_id: current_user.id, question_id: params["ques_id-#{i}".to_sym], mod_id: params[:mod_id], ans_marked: params["ques-#{i}".to_sym],correct: corr)
		end

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
end
