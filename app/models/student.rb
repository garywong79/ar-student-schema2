require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here
	def name
		"#{first_name} #{last_name}"
	end

	def age
		now = Date.today
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
	end

end