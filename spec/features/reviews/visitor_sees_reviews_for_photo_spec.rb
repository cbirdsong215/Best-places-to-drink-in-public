require 'rails_helper'

feature "visitor sees list of reviews on food page" do
  scenario "sees reviews for specific photo" do

    user4 = User.create(first_name: 'user4', last_name: 'user4', email: 'user4@email.com', password: 'password', password_confirmation: 'password', admin: false)

    sign_in_as(user4)

    food4 = Food.create(name: "some food pic", description: "this is sooo funny", user: user4)

    review_for_food4 = Review.create(rating: 5, body: "awesome", user: user4, food: food4)

    visit food_path(food4.id)

    expect(page).to have_content food4.name
    expect(page).to have_content review_for_food4.rating
    expect(page).to have_content review_for_food4.body
    expect(page).to have_content review_for_food4.created_at.strftime("%B %d %Y")
  end
end
