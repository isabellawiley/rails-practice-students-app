# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do
    Instructor.create({
        name: Faker::Name.last_name
    })
end

majors = ["Software Engineering", "Math", "English", "Biology", "History"]

20.times do
    Student.create({
        name: Faker::Name.name,
        major: majors.sample,
        age: rand(18..45),
        instructor: Instructor.all.sample
    })
end