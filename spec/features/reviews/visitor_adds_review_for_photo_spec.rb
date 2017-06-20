require 'rails_helper'

feature "User can add a review for food" do

  let(:user) { User.create(
    first_name: 'first',
    last_name: 'last',
    email: 'whateever@yahoo.com',
    password: 'password',
    password_confirmation: 'password'
  )}

  scenario "adds a review for a food" do
    sign_in_as(user)

    food_photo = Food.create(name: "some food pic", description: "this is sooo funny", user: user)
  
    visit food_path(food_photo)

    click_link "Add a Review"

    expect(page).to have_content food_photo.name

    fill_in "Rating", with: 5
    fill_in "Review", with: "This is awesome!!"

    click_button "Add Review"


    expect(page).to have_content "Review was successfully created."
    expect(page).to have_content food_photo.name
    expect(page).to have_content 5
    expect(page).to have_content "This is awesome!!"
  end
end
