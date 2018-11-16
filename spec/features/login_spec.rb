require 'rails_helper'

describe "the signin process", type: :feature do

  before :each do
    #User.create(email: 'user@example.com', password: 'password')
  end

  # FIXME: We cannot create a User unless we have a schema
  # Else we just get 'Table User does not exist'
  #fixtures :users

  skip "has one user" do
    user(:one)
    p User.count
    #expect(User.count).to eq(1)
  end

  it "signs me in" do
    visit '/sessions/new'
    expect(page).to have_selector('#userinfo')
    expect(page).to have_selector('#username_or_email')

    within("#userinfo") do
      fill_in 'username_or_email', with: 'user@example.com'
      fill_in 'password', with: 'password'

      expect(find_field('username_or_email').value).to eq 'user@example.com'
      expect(find_field('password').value).to eq 'password'
    end

    #click_button 'SIGN IN TO YOUR ACCOUNT'

    #save_and_open_page
    #expect(page).to have_content 'Success'
  end
end
