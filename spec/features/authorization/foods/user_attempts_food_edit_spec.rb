require "rails_helper"

xfeature "user attempts to edit an existing food" do
  let!(:user) {User.create(first_name: 'User', last_name: 'User1',
    email: 'user1@email.com', password: 'password', password_confirmation: 'password',
     admin: false)}

  scenario "user gets redirected if not signed in" do

    food1 = Food.create(name: "sample name", description: "sample description", photo: "sample.jpg", user: user)

    visit edit_food_path(food1)
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end

  scenario "user sees food#edit if signed in and owner" do

    food = Food.create(name: "sample name", description: "sample description", photo: "sample.jpg", user: user)

    sign_in_as(user)
    visit edit_food_path(food)

    expect(page).to have_content("Editing Food")

  end

  scenario "user sees food#edit if signed in and admin" do
    user2 = User.create(first_name: "Not", last_name: "Admin", email: "fake@gmail.com", password: "password", password_confirmation: "password", admin: true)
    food2 = Food.create(name: "sample name", description: "sample description", photo: "sample.jpg", user: user)

    sign_in_as(user)
    visit edit_food_path(food2)

    expect(page).to have_content("Editing Food")

  end

  scenario "user gets redirected if signed in but not owner" do

    user3 = User.create(first_name: "Not", last_name: "Admin", email: "fake@gmail.com", password: "password", password_confirmation: "password", admin: false)
    food3 = Food.create(name: "sample name", description: "sample description", photo: "sample.jpg", user: user)

    sign_in_as(user3)
    visit edit_food_path(food3)

    expect(page).to_not have_content("Editing Food")

  end
end
