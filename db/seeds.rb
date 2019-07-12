# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: "test@email.com",
        phone: Faker::PhoneNumber.phone_number,
        password: "password",
        address: Faker::Address.building_number,
        city: Faker::Address.city,
        state: Faker::Address.state,
        zip_code: Faker::Address.zip_code(state_abbreviation = 'FL')
      )

10.times do
  user = User.create(
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          email: Faker::Internet.email,
          phone: Faker::PhoneNumber.phone_number,
          password: Faker::Number.hexadecimal,
          address: Faker::Address.building_number,
          city: Faker::Address.city,
          state: Faker::Address.state,
          zip_code: Faker::Address.zip_code(state_abbreviation = 'FL')
        )
end

5.times do |x|
  profile = Profile.create(
    profile_title: '',
    description: "Description #{x}",
    certifications: "Certification #{x}",
    # availability: '',
    education_level: "Education Level #{x}",
    skills: "Skill #{x}",
    user_id: x + 1
  )
  5.times do
    s_time = Faker::Time.between(DateTime.now - 1, DateTime.now)
    sentence = Faker::Lorem.sentences
    lesson = Lesson.create(
      description: sentence.first ,
      start_time: s_time,
      location: Faker::Address.street_address,
      attendees_number: Faker::Number.digit,
      end_time: s_time + 2.hours,
      student_requirements: Faker::Lorem.words,
      supplied_by_teacher: Faker::Name,
      comments: sentence.last,
      profile_id: profile.id
    )
    begin
      User.find(x + 1).lessons << lesson
      User.find(x + 2).lessons << lesson
    rescue
      puts " :P "
    end
  end
end



Lesson.all.each do |lesson|

  5.times do
    Review.create(
      lesson_id: lesson.id,
      user_id: User.find( User.ids.sample ),
      comments: Faker::Lorem.sentences.first,
      rating: Faker::Number.digit,
    )
  end
end

puts "Seed complete"
