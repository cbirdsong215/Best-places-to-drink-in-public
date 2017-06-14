require 'spec_helper'

feature "user can add a new food photo" do
  scenario "user adds new food photo successfully" do

    visit new_food_photo_path
    expect(page).to have_content "Add New Food Photo"

    fill_in 'First Name', with: "Bob"
    fill_in 'Last Name', with: "Smith"
    fill_in 'description', with: "This is an awesome pic"
    fill_in 'phot_url', with: "Boston"
    fill_in '', with: "Massachusetts"
    fill_in 'Zip', with: "02111"
    fill_in 'Description', with: "This old-school-style Italian deli serves breakfast fare & a range of sandwiches, roll-ups & salads."

    click_button "Add Photo"

    expect(page).to have_content "Restaurant added successfully"
    expect(page).to have_content "Figaro's"
    expect(page).to have_content "This old-school-style Italian deli serves breakfast fare & a range of sandwiches, roll-ups & salads."
  end

  scenario "visitor does not provide proper information for a restaurant" do
    visit new_restaurant_path

    click_button "Add Restaurant"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Address can't be blank"
    expect(page).to have_content "City can't be blank"
    expect(page).to have_content "State can't be blank"
    expect(page).to have_content "Zip can't be blank"
    expect(page).to have_content "Zip is the wrong length (should be 5 characters)"
    expect(page).to have_content "Zip is not a number"
  end
end
