require 'rails_helper'

feature 'user votes', js: true do

  let!(:user) { User.create(first_name: 'user', last_name: 'user', email: 'user@email.com', password: 'password', password_confirmation: 'password', admin: false)}

  let!(:food) { Food.create(
    name: "food name",
    description: "food description",
    photo: "food_pic.com",
    user: user
  )}

  let!(:review) { Review.create(
    rating: 5,
    body: "Food review",
    user: user,
    food: food
  )}

  scenario 'user votes on review' do
    sign_in_as(user)
    visit food_path(food)
    expect(page).to have_content("Total: 0")
    click_button("Thumb Up")
    expect(page).to have_content("Total: 1")
  end

  scenario 'user changes vote on review' do
    sign_in_as(user)
    visit food_path(food)

    click_button("Thumb Up")
    expect(page).to have_content("Total: 1")
    click_button("Thumb Down")
    expect(page).to have_content("Total: -1")
    click_button("Thumb Down")
    expect(page).to have_content("Total: 0")
    click_button("Thumb Up")
    expect(page).to have_content("Total: 1")
    click_button("Thumb Up")
    expect(page).to have_content("Total: 0") 
  end
end
