require_relative '../../db/config'


class Student < ActiveRecord::Base
# implement your Student model here
validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
validates :email, uniqueness: true
validates :age, numericality: {greater_than: 5}
validate :phone_must_have_10_digits_or_more

	def name
		"#{first_name} #{last_name}"
	end

	def age
		now = Date.today
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
	end

	private
	def phone_must_have_10_digits_or_more
		unless phone.gsub(/[^\d]/, '').length >=10
			errors.add(:phone, "invalid phone number")
		end
	end

end