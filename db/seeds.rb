# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create Users

# Selma
User.create = {
  username: "salmassiya",
  email: "salma@codebank.com",
  password: "123456",
  password_confirmation: "123456",
  # admin: true
  }

# André
User.create = {
  username: "Als97310",
  email: "andre@codebank.com",
  password: "123456",
  password_confirmation: "123456",
  # admin: true
  }

# Fred
User.create = {
  username: "fregent",
  email: "fred@codebank.com",
  password: "123456",
  password_confirmation: "123456",
  # admin: true
  }

# Émeraude
User.create = {
  username: "Emeraude00",
  email: "emeraude@codebank.com",
  password: "123456",
  password_confirmation: "123456",
  # admin: true
  }

# Snippet 1
Snippet.create = {
  title: "reset PG Database on Heroku",
  code: "heroku restart; heroku pg:reset DATABASE --confirm (replace by your app name); heroku run rake db:migrate",
  description: "Restarts Heroku, then resets the database of your application, before running all migrations on Heroku.",
  language: "Bash",
  user_id: 1,
  private: false,
  upvotes: 0
  }

# Snippet 2
Snippet.create = {
  title: "clone repository from github",
  code: "mkdir ~/code/OWNER_GITHUB_USERNAME
  cd ~/code/OWNER_GITHUB_USERNAME
  git clone git@github.com:OWNER_GITHUB_USERNAME/PROJECT_NAME.git
  cd PROJECT_NAME",
  description: "Creates a new directory, then moves to the created directory, then clones the Git",
  language: "Bash",
  user_id: 2,
  private: false,
  upvotes: 0
  }

# Snippet 3
Snippet.create = {
  title: "merge master into your branch",
  code: "git status
  git checkout master
  git pull origin master
  git checkout (your-branch-name)
  git merge master",
  description: "Creates a new directory, then moves to the created directory, then clones the Git",
  language: "Bash",
  user_id: 3,
  private: false,
  upvotes: 0
  }

# Snippet 4
Snippet.create = {
  title: "create a new branch",
  code: "git checkout -b (new-branch-name)",
  description: "Creates a new branch from the current branch",
  language: "Bash",
  user_id: 4,
  private: false,
  upvotes: 0
  }

# Snippet 5
Snippet.create = {
  title: "API parsing",
  code: "require 'open-uri'
  require 'json'
  puts 'Cleaning up database...'
  Movie.destroy_all
  puts 'Database cleaned'
  url = 'http://tmdb.lewagon.com/movie/top_rated'
  10.times do |i|" +
    "puts 'Importing movies from page #{i + 1}'"
    "movies = JSON.parse(URI.open('#{url}?page=#{i + 1}').read)['results']
    movies.each do |movie|
      puts 'Creating #{movie["title"]}'
      base_poster_url = 'https://image.tmdb.org/t/p/original'
      Movie.create(
        title: movie['title'],
        overview: movie['overview'],
        poster_url: '#{base_poster_url}#{movie["backdrop_path"]}',
        rating: movie['vote_average']
      )
    end
  end
  puts 'Movies created'",
  description: "Parse the API and save it in the database.",
  language: "Ruby",
  user_id: 1,
  private: false,
  upvotes: 0
  }

# Snippet 6
Snippet.create = {
  title: "create a new model on Rails",
  code: "rails g model Movie title overview:text poster_url rating:integer",
  description: "Creates a new model on Rails. You can specify the attributes of the model, which are the columns in the table. They are strings by default.",
  language: "Ruby",
  user_id: 1,
  private: false,
  upvotes: 0
  }

# Snippet 7
Snippet.create = {
  title: "create a new controller on Rails",
  code: "rails g controller movies index",
  description: "Creates a new controller on Rails. You can specify the actions that the controller will handle.",
  language: "Ruby",
  user_id: 1,
  private: false,
  upvotes: 0
  }

# Snippet 8
Snippet.create = {
  title: "close a local-host port",
  code: "npx kill-port 3000",
  description: "Closes a local-host port.",
  language: "Bash",
  user_id: 1,
  private: false,
  upvotes: 0
  }
