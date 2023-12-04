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
  Snippet.create!(
    title: "reset PG Database on Heroku",
    content: "heroku restart; heroku pg:reset DATABASE --confirm (replace by your app name); heroku run rake db:migrate",
    description: "Restarts Heroku, then resets the database of your application, before running all migrations on Heroku.",
    language: "Bash",
    user_id: 1,
    private: false,
  )

  # Snippet 2
  Snippet.create!(
    title: "clone repository from github",
    content: "mkdir ~/code/OWNER_GITHUB_USERNAME
    cd ~/code/OWNER_GITHUB_USERNAME
    git clone git@github.com:OWNER_GITHUB_USERNAME/PROJECT_NAME.git
    cd PROJECT_NAME",
    description: "Creates a new directory, then moves to the created directory, then clones the Git",
    language: "Bash",
    user_id: 2,
    private: false,
  )

  # Snippet 3
  Snippet.create!(
    title: "merge master into your branch",
    content: "git status
    git checkout master
    git pull origin master
    git checkout (your-branch-name)
    git merge master",
    description: "Creates a new directory, then moves to the created directory, then clones the Git",
    language: "Bash",
    user_id: 3,
    private: false,

  )

  # Snippet 4
  Snippet.create!(
    title: "create a new branch",
    content: "git checkout -b (new-branch-name)",
    description: "Creates a new branch from the current branch",
    language: "Bash",
    user_id: 4,
    private: false,
  )

  # Snippet 5
  Snippet.create!(
    title: "API parsing",
    content: "\nrequire ‘open-uri’\nrequire ‘json’\nputs \“Cleaning up database...\“\nMovie.destroy_all\nputs \“Database cleaned\“\nurl = \“http://tmdb.lewagon.com/movie/top_rated\“\n10.times do |i|\n puts \“Importing movies from page \#{i + 1}\“\n movies = JSON.parse(URI.open(\“\#{url}?page=\#{i + 1}\“).read)[‘results’]\n movies.each do |movie|\n  puts \“Creating \#{movie[‘title’]}\“\n  base_poster_url = \“https://image.tmdb.org/t/p/original\“\n  Movie.create(\n   title: movie[‘title’],\n   overview: movie[‘overview’],\n   poster_url: \“\#{base_poster_url}\#{movie[‘backdrop_path’]}\“,\n   rating: movie[‘vote_average’]\n  )\n end\nend\nputs \“Movies created\“",
    description: "Parse the API and save it in the database.",
    language: "Ruby",
    user_id: 1,
    private: false,
  )

  # Snippet 6
  Snippet.create!(
    title: "create a new model on Rails",
    content: "rails g model Movie title overview:text poster_url rating:integer",
    description: "Creates a new model on Rails. You can specify the attributes of the model, which are the columns in the table. They are strings by default.",
    language: "Ruby",
    user_id: 1,
    private: false,
  )

  # Snippet 7
  Snippet.create!(
    title: "create a new controller on Rails",
    content: "rails g controller movies index",
    description: "Creates a new controller on Rails. You can specify the actions that the controller will handle.",
    language: "Ruby",
    user_id: 1,
    private: false,
  )

  # Snippet 8
  Snippet.create!(
    title: "close a local-host port",
    content: "npx kill-port 3000",
    description: "Closes a local-host port.",
    language: "Bash",
    user_id: 1,
    private: false,
  )

  # Create 50 snippets
  # 50.times do
  #   Snippet.create!(
  #     title: Faker::Lorem.words(number: 3).join(" "),
  #     content: Faker::HTML.random,
  #     private: [true, false].sample,
  #     language: [ "Ruby", "JavaScript", "HTML", "CSS", "Java", "Python", "PHP", "C", "TypeScript", "Swift", "Bash", "Multiple", "Objective-C", "C++", "C#"].sample,
  #     user_id: rand(1..4),
  #     description: Faker::Lorem.sentence
  #   )
  # end

  puts "Finished!"
else
  puts "You did not type 'Y'."
end
puts "Now exiting..."
