require "rails_helper"

feature "user can add a new food" do
  scenario "visitor adds a new food successfully" do
    user1 = User.create(first_name: 'User1', last_name: 'User1', email: 'user1@email.com', password: 'password', password_confirmation: 'password', admin: false)

    sign_in_as(user1)

    visit new_food_path
    expect(page).to have_content "New Food"

    fill_in 'Name', with: "Awesome Taco"
    fill_in 'Description', with: "This is the best taco ever"
    attach_file("Photo","#{Rails.root}/spec/fixtures/sample.jpg")
    click_button "Submit"

    expect(page).to have_content "Awesome Taco"
    expect(page).to have_content "This is the best taco ever"
    expect(page).to have_content "Food added successfully"

  end

end
