require 'rails_helper'
feature "guest user creates an account" do
  scenario "successfully creates a new user account" do
    visit new_user_path
    fill_in "user_first_name", with: "shane"
    fill_in "user_last_name", with: "chang"
    fill_in "user_email", with: "schang@codingdojo.com"
    click_button "Create User"
    expect(page).to have_content "Welcome, shane"
    visit users_path + "/#{User.last.id}"
    expect(page).to have_current_path(user_path(User.last))    
  end

  scenario "unsuccessfully creates a new user account" do 
    visit new_user_path
    fill_in "user_first_name", with: ""
    fill_in "user_last_name", with: "chang"
    fill_in "user_email", with: "schang@codingdojo.com"
    click_button "Create User"
    expect(page).to have_current_path(new_user_path)
  end

  scenario "doesn't fill out first name field" do 
    visit new_user_path
    fill_in "user_last_name", with: "shane"
    fill_in "user_email", with: "schang@codingdojo.com"
    click_button "Create User"
    expect(page).to have_content "First name can't be blank"
  end


  scenario "doesn't fill out last name field" do 
    visit new_user_path
    fill_in "user_first_name", with: "shane"
    fill_in "user_email", with: "schang@codingdojo.com"
    click_button "Create User"
    expect(page).to have_content "Last name can't be blank"
  end

  scenario "doesn't fill out email field" do 
    visit new_user_path
    fill_in "user_first_name", with: "shane"
    fill_in "user_last_name", with: "shane"
    click_button "Create User"
    expect(page).to have_content "Email can't be blank"
  end
end