class AdminsController < ApplicationController
	def sign_in
	end

	def index
		if session[:user_id]
			a=Admin.find(session[:user_id])
			if (a.blank?)
				return redirect_to action: 'sign_in'
			end
			@signed_in_admin =Admin.find(session[:user_id])
		else
			redirect_to action: 'sign_in'
		end		
	end	

	def create_session
		a=Admin.find_by(username: params[:username], password: params[:password])

		if (a.blank?)
			return redirect_to action: 'sign_in'
		end

		 session[:user_id] = a.id
		redirect_to action: 'index'	
	end	

	def sign_out
		 if !session[:user_id].blank?
		 	session.delete(:user_id)
		 end
		 
		 redirect_to action: 'index'	
	end	

	def add_assignment
		if session[:user_id].blank?
		 	redirect_to action: 'index'
		 end
		 @n1=Field.first
		 @n=@n1.num
		 @n=0
		 @n1.num=@n
		 @n1.save
	end	

	def assignment_create
		if session[:user_id].blank?
		 	redirect_to action: 'index'
		 end
		last=Field.first.num
		mod=Mod.find_by_name(params[:mod_name])
		modi=mod.id
		for i in 1..last
			Question.create(mod_id: modi,ques: params["ques-#{i}".to_sym],option1: params["option1-q#{i}".to_sym],option2: params["option2-q#{i}".to_sym],option3: params["option3-q#{i}".to_sym],answer:params["ans-#{i}".to_sym],queshin:params["queshin-#{i}".to_sym],option1hin:params["option1hin-q#{i}".to_sym],option2hin:params["option2hin-q#{i}".to_sym],option3hin:params["option3hin-q#{i}".to_sym])
		end	
		redirect_to action: 'index'
	end	

	def question_create
		if session[:user_id].blank?
		 	redirect_to action: 'index'
		 end
		 @n1=Field.first
		 @n=@n1.num
		 @n=@n+1
		 @n1.num=@n
		 @n1.save
	end	

	def add_module
		if session[:user_id].blank?
		 	redirect_to action: 'index'
		 end
		@courses=Course.all
	end	

	def module_create
		if session[:user_id].blank?
		 	redirect_to action: 'index'
		 end
		Mod.create(course_id:params[:course],video:params[:vid_name],name:params[:mod_name])
		redirect_to action: 'add_study_material'
	end	

	def add_study_material
		if session[:user_id].blank?
		 	redirect_to action: 'index'
		 end
		@mod=Mod.last
	end

	def create_study_material
		if session[:user_id].blank?
		 	redirect_to action: 'index'
		 end
		mod=Mod.find(params[:id])
		mod.document=params[:mod][:document]
		mod.save
		redirect_to action: 'index'
	end	
end
