class Api::StudentsController < Api::BaseController
	respond_to :json

	def submit_score
		if params[:correct].present? && params[:incorrect].present? && params[:game_id].present?
			game = Game.find_by(params[:game_id])
			if game
				new_score = Score.new
				new_score.correct_answers = params[:correct]
				new_score.incorrect_answers = params[:incorrect]
				new_score.game_id = params[:game_id]
				#Set the student_id value to 1 when testing against a RESTFUL Simulating App like Post man
				new_score.student_id = current_user.id
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

end
