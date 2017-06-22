require "rails_helper"

feature "user can delete profile" do
  scenario "user visits profile page and deletes profile" do
    user5 = User.create(first_name: 'user5', last_name: 'user5', email: 'user5@email.com', password: 'password', password_confirmation: 'password', admin: false)

    sign_in_as(user5)
    id = user5.id
    visit user_path(user5)
    expect(page).to have_content "Delete Account"
    click_link "Delete Account"

    User.exists?(id).should be_falsey

    expect(page).to have_current_path(root_path)
  end
end
