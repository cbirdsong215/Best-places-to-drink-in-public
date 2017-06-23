require 'rails_helper'

feature "User can add a review for food" do

  let(:user) { User.create(
    first_name: 'first',
    last_name: 'last',
    email: 'whateever@yahoo.com',
    password: 'password',
    password_confirmation: 'password'
  )}
  let!(:food) { Food.create(
    name: "food name",
    description: "food description",
    photo: "food_pic.com",
    user: user
  )}

  scenario "Successfully adds a review for a food" do

    sign_in_as(user)

    visit food_path(food)

    click_link "Add a Review"

    fill_in "Rating", with: 5
    fill_in "Review", with: "This is awesome!!"

    click_button "Create Review"


    expect(page).to have_content "Review was successfully created."
    expect(page).to have_content food.name
    expect(page).to have_content 5
    expect(page).to have_content "This is awesome!!"
  end

  scenario "tries to add a review with unaccepted rating" do
    sign_in_as(user)

    visit food_path(food)
    click_link "Add a Review"
    fill_in "Rating", with: ''
    click_button "Create Review"

    expect(page).to have_content "Rating can't be blank and Rating must be a whole number between 1 - 5"

    visit food_path(food)
    click_link "Add a Review"
    fill_in "Rating", with: 'not a number'
    click_button "Create Review"

    expect(page).to have_content "Rating must be a whole number between 1 - 5"

  end
end
