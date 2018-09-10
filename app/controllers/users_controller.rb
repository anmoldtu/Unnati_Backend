class UsersController < ApplicationController

	def dashboard
		
	end

	def Assignment
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

			Result.create(user_id: 1, question_id: params["ques_id-#{i}".to_sym], mod_id: params[:mod_id], ans_marked: params["ques-#{i}".to_sym],correct: corr)
		end

		redirect_to action: 'result_show',uid:1,mid:params[:mod_id] 

	end	

	def result_show
		@results=Result.where(user_id:params[:uid],mod_id:params[:mid])
		if(@results.blank?)
			redirect_to action: 'dashboard'
		end	
		@questions=Question.where(mod_id: params[:mid])
		@correctAns=Result.where(user_id:params[:uid],mod_id:params[:mid],correct: 1).length
	end	
end
