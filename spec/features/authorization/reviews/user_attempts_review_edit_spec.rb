require "rails_helper"

xfeature "user attempts to edit another user's profile" do

  let!(:user) {User.create(first_name: 'User', last_name: 'User1',
    email: 'user1@email.com', password: 'password', password_confirmation: 'password',
     admin: false)}
  let!(:food) {Food.create(name: "Awesome Taco", description: "This is one awesome taco.", user: user)}
  let!(:review) {Review.create(body: "Meh", rating: 2, user: user, food: food)}

  scenario "unsigned user gets redirected to the sign-in page" do

    visit edit_food_review_path(food, review)
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end

  scenario "signed-in user tries to edit their review" do
    sign_in_as(user)
    visit edit_food_review_path(food,review)

    expect(page).to have_content("Editing Review")

  end
end
