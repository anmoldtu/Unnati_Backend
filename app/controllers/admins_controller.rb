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
		last=Field.first.num
		mod=Mod.find_by_name(params[:mod_name])
		modi=mod.id
		for i in 1..last
			Question.create(mod_id: modi,ques: params["ques-#{i}".to_sym],option1: params["option1-q#{i}".to_sym],option2: params["option2-q#{i}".to_sym],option3: params["option3-q#{i}".to_sym],answer:params["ans-#{i}".to_sym])
		end	
		redirect_to action: 'index'
	end	

	def question_create
		 @n1=Field.first
		 @n=@n1.num
		 @n=@n+1
		 @n1.num=@n
		 @n1.save
	end	
end
