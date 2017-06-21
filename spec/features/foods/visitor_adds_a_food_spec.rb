require "rails_helper"

feature "user can add a new food" do
  let!(:user) { User.create(first_name: 'user', last_name: 'user', email: 'user@email.com', password: 'password', password_confirmation: 'password', admin: false)}

  scenario "visitor adds a new food successfully" do

    sign_in_as(user)

    visit new_food_path
    expect(page).to have_content "New Food"

    fill_in 'Name', with: "Awesome Taco"
    fill_in 'Description', with: "This is the best taco ever"
    fill_in 'Photo', with: "taco.pic"

    click_button "Submit"

    expect(page).to have_content "Awesome Taco"
    expect(page).to have_content "This is the best taco ever"

  end
end
