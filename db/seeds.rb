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
  # User.destroy_all
  # Snippet.destroy_all
  # Directory.destroy_all
  puts "Creating new users..."

  Create Users

  Selma
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



directory1 = Directory.create!(name: "Ruby Examples", private: false)
directory2 = Directory.create!(name: "JavaScript Snippets", private: true)
directory3 = Directory.create!(name: "Python Code", private: false)
directory4 = Directory.create!(name: "Life Code", private: false)
directory5 = Directory.create!(name: "Going out Code", private: true)
directory6 = Directory.create!(name: "Work Code", private: false)
directory7 = Directory.create!(name: "Home Code", private: true)
directory8 = Directory.create!(name: "Car Code", private: false)


Snippet.create!(
  title: "Ruby Snippet 1",
  content: 'puts "Hello, Ruby!"\nputs "Welcome to the Ruby world"',
  language: "Ruby",
  private: [true, false].sample,
  user_id: rand(1..4),
  directory: directory1
)

Snippet.create!(
  title: "Ruby Snippet 2",
  content: 'def greet(name)\n  puts "Hello, #{name}!"\nend',
  language: "Ruby",
  private: [true, false].sample,
  user_id: rand(1..3),
  directory: directory1
)

# JavaScript Snippets
Snippet.create!(
  title: "JavaScript Snippet 1",
  content: 'console.log("Hello, JavaScript!");\nconsole.log("Welcome to the JavaScript world");',
  language: "JavaScript",
  private: [true, false].sample,
  user_id: rand(1..3),
  directory: directory2
)

Snippet.create!(
  title: "JavaScript Snippet 2",
  content: 'function add(a, b) {\n  return a + b;\n}',
  language: "JavaScript",
  private: [true, false].sample,
  user_id: rand(1..3),
  directory: directory2
)

# Python Snippets
Snippet.create!(
  title: "Python Snippet 1",
  content: 'print("Hello, Python!")\nprint("Welcome to the Python world")',
  language: "Python",
  private: [true, false].sample,
  user_id: rand(1..3),
  directory: directory3
)

Snippet.create!(
  title: "Python Snippet 2",
  content: 'def multiply(x, y):\n  return x * y',
  language: "Python",
  private: [true, false].sample,
  user_id: rand(1..3),
  directory: directory1
)

Snippet.create!(
  title: "Ruby Snippet 1",
  content: 'puts "Hello, Ruby!"\nputs "Welcome to the Ruby world"',
  language: "Ruby",
  private: [true, false].sample,
  user_id: rand(1..3),
  directory: directory8
)

Snippet.create!(
  title: "Ruby Snippet 2",
  content: 'def greet(name)\n  puts "Hello, #{name}!"\nend',
  language: "Ruby",
  private: [true, false].sample,
  user_id: rand(1..3),
  directory: directory6
)

# JavaScript Snippets
Snippet.create!(
  title: "JavaScript Snippet 1",
  content: 'console.log("Hello, JavaScript!");\nconsole.log("Welcome to the JavaScript world");',
  language: "JavaScript",
  private: [true, false].sample,
  user_id: rand(1..3),
  directory: directory3
)

Snippet.create!(
  title: "JavaScript Snippet 2",
  content: 'function add(a, b) {\n  return a + b;\n}',
  language: "JavaScript",
  private: [true, false].sample,
  user_id: rand(1..3),
  directory: directory5
  )


  puts "Finished!"
else
  puts "You did not type 'Y'."
end
puts "Now exiting..."
