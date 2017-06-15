require "rails_helper"

feature "user can add a new food" do
  scenario "visitor adds a new food successfully" do
    user1 = User.create(first_name: 'User1', last_name: 'User1', email: 'user1@email.com', password: 'password', password_confirmation: 'password', admin: false)

    sign_in_as(user1)

    visit new_food_path
    expect(page).to have_content "New Food"

    fill_in 'Name', with: "Awesome Taco"
    fill_in 'Description', with: "This is the best taco ever"
    fill_in 'Photo', with: "taco.pic"

    click_button "Submit"

    expect(page).to have_content "Awesome Taco"
    expect(page).to have_content "This is the best taco ever"
    expect(page).to have_content "taco.pic"

  end

  # scenario "visitor does not provide proper information for a food" do
  #   visit new_food_path
  #
  #   click_button "Add Restaurant"
  #   expect(page).to have_content "Name can't be blank"
  #   expect(page).to have_content "Address can't be blank"
  #   expect(page).to have_content "City can't be blank"
  #   expect(page).to have_content "State can't be blank"
  #   expect(page).to have_content "Zip can't be blank"
  #   expect(page).to have_content "Zip is the wrong length (should be 5 characters)"
  #   expect(page).to have_content "Zip is not a number"
  # end
end
