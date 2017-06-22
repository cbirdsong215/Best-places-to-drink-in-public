require "rails_helper"

feature "user can add a new food" do

  let!(:user) {User.create(first_name: 'User', last_name: 'User1',
    email: 'user1@email.com', password: 'password', password_confirmation: 'password',
     admin: false)}
  scenario "visitor adds a new food successfully" do

    sign_in_as(user)
    visit new_food_path
    expect(page).to have_content "New Food"

    fill_in 'Name', with: "Awesome Taco"
    fill_in 'Description', with: "This is the best taco ever"
    attach_file("Photo","#{Rails.root}/spec/fixtures/sample.jpg")
    click_button "Submit"

    expect(page).to have_content("Awesome Taco")
    expect(page).to have_content("This is the best taco ever")
    expect(page).to have_content("Food added successfully")

  end

  scenario "visitor sees view on homepage after adding one" do

    sign_in_as(user)
    visit new_food_path
    expect(page).to have_content "New Food"

    fill_in 'Name', with: "Awesome Taco"
    fill_in 'Description', with: "This is the best taco ever"
    attach_file("Photo","#{Rails.root}/spec/fixtures/sample.jpg")
    click_button "Submit"

    expect(page).to have_content("Awesome Taco")
    expect(page).to have_content("This is the best taco ever")
    expect(page).to have_content("Food added successfully")
    page.find('img')['src'].should have_content '/assets/fallback/profile_default-ca7c83d4283250d25a9389e52370105ee6df28fa09a7b749e6de485ee8cb030c.png'

  end

end
