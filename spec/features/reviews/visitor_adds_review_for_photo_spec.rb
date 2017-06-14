require 'rails_helper'

feature "User can add a review for food" do
  scenario "adds a review for a food" do
    user = User.create(first_name: 'pete', last_name: 'corb', email: 'whateever@yahoo.com', password: 'password', password_confirmation: 'password')

    food_pic = Food.create(name: "some food pic", description: "this is sooo funny", photo: "food_pic.com", user: user)

    visit food_path(food_pic)

    click_link "Add a Review"

    expect(page).to have_content food_pic.name
    expect(page).to have_content food_pic.photo


    fill_in "Rating", with: 5
    fill_in "Review", with: "This is awesome!!"
    click_button "Add Review"

    expect(page).to have_content "Review added successfully"
    expect(page).to have_content food_pic.name
    expect(page).to have_content 5
    expect(page).to have_content "This is awesome!!"
  end
end
