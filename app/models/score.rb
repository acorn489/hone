class Score < ActiveRecord::Base
	belongs_to :student
	belongs_to :game

	validates :correct_answers, :incorrect_answers, 
		:student_id, :game_id, :value_out_ten,
		presence: true

	def refresh_records
		self.refresh_best_personal_score
		self.refresh_best_global_score
	end

	#  A method to refresh the best personal score of a student for the game
	def refresh_best_personal_score
		current_best_score = Score.where(:best_personal_score => true, 
			:student_id => self.student_id, :game_id => self.game_id).first
		new_score = self
		if current_best_score
			if(new_score.value_out_ten >= current_best_score.value_out_ten)
				if(new_score.value_out_ten > current_best_score.value_out_ten)
					current_best_score.update(best_personal_score: false)
				end
				new_score.update(best_personal_score: true)
			end
		else
			new_score.update(best_personal_score: true)
		end
	end

	# A method to referesh the best global score of the game
	def refresh_best_global_score
		current_best_scores = Score.where(:best_global_score => true, :game_id => self.game_id).all
		new_score = self
		if current_best_scores.count > 0
			current_best_scores.each do |current_best_score|
				if(new_score.value_out_ten >= current_best_score.value_out_ten)
					if(new_score.value_out_ten > current_best_score.value_out_ten)
						current_best_score.update(best_global_score: false)
					end
					new_score.update(best_global_score: true)
				end
			end
		else
			new_score.update(best_global_score: true)
		end
	end

	def calculate_score_value
		self.value_out_ten = 10*self.correct_answers.to_f/(self.correct_answers + self.incorrect_answers)
	end

	# A method to check if a student passes the game or not and unlock games if possible
	def check_if_skill_passed
		game = self.game
		student = self.student
		if(self.value_out_ten >= game.passing_score)
			pass = Pass.new
			pass.skill = game.primary_skill
			pass.student = student
			pass.save
			skill = pass.skill
			if(skill.level_passed(student.id))
				#Increase student's performance level
				level = Level.where(:student => student, :course_id => skill.course_id)
				level.level_up
				if(skill.grade_passed(student_id))
					skill.unlock_level_games
				elsif(skill.domain_passed(student_id))
					skill.unlock_domain_games
				else
					skill.unlock_dependency_games
				end
			elsif(skill.domain_passed(student_id))
				skill.unlock_domain_games
			else
				skill.unlock_dependency_games
			end
		end
	end
end
