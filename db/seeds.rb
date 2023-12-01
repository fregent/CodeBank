# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# I18n.config.available_locales = :en
puts "The database will be reset... Are you sure? (Type 'Y' to comfirm)"
validation = gets.chomp
if validation.include?("Y")

  puts "Cleaning database..."
  User.destroy_all
  puts "Creating new users..."

  # Create Users

  # Selma
  User.create!(
    first_name: "Salma",
    last_name: "Zakha",
    username: "salmassiya",
    email: "selma@codebank.com",
    password: "123456",
    password_confirmation: "123456",
    admin: true
  )

  # Fred
  User.create!(
    first_name: "Frédéric",
    last_name: "Régent",
    username: "fregent",
    email: "fred@codebank.com",
    password: "123456",
    password_confirmation: "123456",
    admin: true
  )

  # André
  User.create!(
    first_name:"André",
    last_name:"Leroy-Sismondino",
    username: "Als97310",
    email: "andre@codebank.com",
    password: "123456",
    password_confirmation: "123456",
    admin: true
  )


  # Émeraude
  User.create!(
    first_name:"Émeraude",
    last_name:"Ntondo",
    username: "Emeraude00",
    email: "emeraude@codebank.com",
    password: "123456",
    password_confirmation: "123456",
    admin: true
  )

  # Snippet 1
  50.times do
    Directory.create!(
      name: Faker::Lorem.word,
      user_id: rand(1..4),
      private: [true, false].sample
    )
  end

  # Create 50 snippets
  50.times do
    Snippet.create!(
      title: Faker::Lorem.words(number: 3).join(" "),
      content: Faker::HTML.random,
      private: [true, false].sample,
      language: [ "Ruby", "JavaScript", "HTML", "CSS", "Java", "Python", "PHP", "C", "TypeScript", "Swift", "Bash", "Multiple", "Objective-C", "C++", "C#"].sample,
      user_id: rand(1..4),
      description: Faker::Lorem.sentence
    )
  end

  puts "Finished!"
else
  puts "You did not type 'Y'."
end
puts "Now exiting..."
