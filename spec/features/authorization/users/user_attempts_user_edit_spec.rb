require "rails_helper"

feature "user attempts to view and edit another user's profile" do
  let!(:user) {User.create(first_name: 'User', last_name: 'User1',
    email: 'user1@email.com', password: 'password', password_confirmation: 'password',
     admin: false)}

  scenario "prospective user gets redirected to the sign-in page" do

    visit edit_user_path(user)
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end

  scenario "user tries to edit a profile via user_edit_path and gets redirected to root" do

    sign_in_as(user)
    visit edit_user_path(user)

    expect(page).to have_content("Edit your profile by clicking your 'profile' link")

  end
end
