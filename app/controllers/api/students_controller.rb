class Api::StudentsController < Api::BaseController
	respond_to :json

	# comment out the before_action line when testing against a RESTFUL Simulating App like Post man because session changes. You will not be able to maintain one session. Hence, You cannot submit a score because you cannot stay logged in for the next api call.
	before_action :confirm_logged_in, :except => [:login, :logout]

	def login
		if params[:username].present? && params[:password].present?
			found_user = Student.where(:username => params[:username]).first
			if found_user
				authorized_user = found_user.authenticate(params[:password])
			end
		end
		if authorized_user
			session[:user_id] = authorized_user.id
			session[:username] = authorized_user.username
			session[:user_type] = "student"
			render :json => true
		else
			render :json => false
		end
	end

	def test
		respond_with "It's working"
	end

	def submit_score
		if params[:correct].present? && params[:incorrect].present? && params[:game_id].present?
			game = Game.find_by(params[:game_id])
			if game
				new_score = Score.new
				new_score.correct_answers = params[:correct]
				new_score.incorrect_answers = params[:incorrect]
				new_score.game_id = params[:game_id]
				#Set the student_id value to 1 when testing against a RESTFUL Simulating App like Post man
				new_score.student_id = session[:user_id]
				new_score.calculate_score_value
				if new_score.save
					new_score.refresh_records
					new_score.check_if_skill_passed
					#new score added
					render :json => true
				else
					#error occured and score wasn't added
					render :json => false
				end
			else
				#The game id doesn't belong to the system
				render :json => false
			end
		else
			#parameters are missing
			render :json => false
		end
	end

	def logout
			session[:student_id] = nil
			session[:username] = nil
			render :json => true
	end

end