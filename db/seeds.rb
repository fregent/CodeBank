# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

  puts "Cleaning database..."
  User.destroy_all

  puts "Creating new users..."


  # User 1
  User.create!(
    username: "Frédou_du77",
    first_name:"Frédéric",
    last_name:"Régent",
    email: "fred@codebank.com",
    password: "123456",
    password_confirmation: "123456",
  )

  # User 2
  User.create!(
    username: "Mister_Dré78",
    first_name:"André",
    last_name:"Leroy-Sismondino",
    email: "andre@codebank.com",
    password: "123456",
    password_confirmation: "123456",
  )

  # User 3
  User.create!(
    username: "Camp_Rock_Sahelma92",
    first_name:"Sahelma",
    last_name:"Zakha",
    email: "selma@codebank.com",
    password: "123456",
    password_confirmation: "123456",
  )

  # User 4
  User.create!(
    username: "Pause_Dodo_du95",
    first_name:"Emeraude",
    last_name:"Ntondo",
    email: "emeraude@codebank.com",
    password: "123456",
    password_confirmation: "123456",
  )
