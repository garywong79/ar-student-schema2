require_relative 'app/models/student'
require_relative 'db/config'

# p Student.column_names

# student = Student.create(first_name: 'Gary', last_name: 'Wong')

p Student.all
# p Student.first