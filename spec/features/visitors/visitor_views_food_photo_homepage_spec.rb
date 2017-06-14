require 'spec_helper'

feature "Visitor views Foodie Review homepage" do
  scenario "visitor sees list of food photos on homepage " do
    phil = User.create(first_name: "Phil", last_name: "Kazan", email: "phil@phil.com" )
    amazing_pizza = Food.create(name:"Amazing Pizza", description: "Best photo ever", photo: "http://photo.com", user: phil)
    cold_milk = Food.create(name:"Cold Milk", description: "Amazing!", photo: "http://photo.com", user: phil)

  visit root_path
  expect(page).to have_content "Phil Kazan"
  expect(page).to have_content "Amazing Pizza"
  end

  scenario "Visitor views log in and sign up options" do
    vist root_path
    expect(page).to have_content "Log In"
    expect(page).to have_content "Sign Up"
  end


  #expect(page).to have_link ""

#   scenario 'visitor sees 10 food items per page' do
#     phil = User.create(first_name: "Phil", last_name: "Kazan", email: "phil@phil.com" )
#     9.times do |n|
#       Food.create(name:"Amazing Pizza #{n}", description: "Best photo ever", photo: "http://photo.com", user: phil)
#     end
#     9.times do |n|
#       Food.create(name:"Ice Cream #{n}", description: "Best photo ever", photo: "http://photo.com", user: phil)
#     end
#
#     visit root_path
#     expect(page).to have_content("Amazing Pizza")
#     expect(page).to_not have_content("Ice Cream")
#
#     click_link("2")
#     expect(page).to have_content("Ice Cream")
#     expect(page).to_not have_content("Amazing Pizza")
#   end
#
 end
