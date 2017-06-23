require "rails_helper"

feature "user can edit a food they created" do

  let!(:user) {User.create(first_name: 'User', last_name: 'User1',
    email: 'user@email.com', password: 'password', password_confirmation: 'password', admin: false)}
  let!(:user2) {User.create(first_name: 'User', last_name: 'User2',
    email: 'user2@email.com', password: 'password', password_confirmation: 'password', admin: false)}
  scenario "visitor edits food successfully" do

    sign_in_as(user)

    food = Food.create(name: "some food pic", description: "this is sooo funny", user: user)

    visit food_path(food)
    click_link "Edit"

    fill_in 'Name', with: "Not Awesome Taco"
    fill_in 'Description', with: "This is not the best taco ever"


    click_button "Submit"

    expect(page).to have_content("Not Awesome Taco")
    expect(page).to have_content("This is not the best taco ever")
    expect(page).to have_content("Successfully updated")

  end

  scenario "visitor inputs incorrect info" do

    sign_in_as(user)

    food = Food.create(name: "some food pic", description: "this is sooo funny", user: user)

    visit food_path(food)
    click_link "Edit"
    fill_in 'Name', with: ""
    fill_in 'Description', with: ""

    click_button "Submit"

    expect(page).to have_content("Name can't be blank and Description can't be blank")

  end

  scenario "visitor cannot edit food that they didn't create" do

    sign_in_as(user2)

    food = Food.create(name: "some food pic", description: "this is sooo funny", user: user)

    visit food_path(food)
    expect(page).to_not have_content("Edit")
  end
end
