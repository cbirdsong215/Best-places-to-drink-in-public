require 'rails_helper'

feature "visitor sees list of reviews on food page" do
    user = User.create(first_name: 'pete', last_name: 'corb', email: 'whateever@yahoo.com', password: 'password', password_confirmation: 'password')

    food_pic = Food.create(name: "some food pic", description: "this is sooo funny", photo: "food_pic.com", user_id: user)

    review_for_food_pic = Review.create(rating: 5, body: "This is the best thing ever", user_id: user, food_id: food_pic)

    different_food_pic = Food.create(name: "some other food pic", description: "this is a different food", photo: "different_food_pic.com", user_id: user)

    review_for_different_food_pic = Review.create(rating: 1, body: "This is completely different then the other one", user_id: user, food_id: different_food_pic)

  scenario "sees reviews for specific photo" do

    visit food_path(food_pic)

    expect(page).to have_content food_pic.name
    expect(page).to have_content review_for_food_pic.rating
    expect(page).to have_content review_for_food_pic.body
    expect(page).to have_content review_for_food_pic.user_id
    expect(page).to have_content review_for_food_pic.created_at.strftime("%B %d %Y")
  end

  scenario "does not see other reviews for other food pics" do

    visit food_path(food_pic)

    expect(page).to have_content food_pic.name
    expect(page).to have_content review_for_food_pic.body

    expect(page).not_to have_content different_food_pic.name
    expect(page).not_to have_content review_for_different_food_pic.rating
    expect(page).not_to have_content review_for_different_food_pic.body
  end
end
