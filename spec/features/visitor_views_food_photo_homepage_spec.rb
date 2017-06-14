# require 'spec_helper'
#
# feature "User views Foodie Review homepage" do
#   scenario "user sees list of food photos on homepage " do
#     phil = User.create(first_name: "Phil", last_name: "Kazan", email: "phil@phil.com" )
#     amazing_pizza = Food.create(name:"Amazing Pizza", description: "Best photo ever", photo: "http://photo.com", user: phil)
#     cold_milk = Food.create(name:"Cold Milk", description: "Amazing!", photo: "http://photo.com", user: phil)
#
#   visit root_path
#   expect(page).to have_content "Phil Kazan"
#   expect(page).to have_content "Amazing Pizza"
#   expect(page).to have_link ""
