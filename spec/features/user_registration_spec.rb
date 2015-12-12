require 'rails_helper'

RSpec.feature "User registration" do 

  context "successful sign up" do 

    let(:user) { build(:user) }
    
    it "renders the home page with flash message" do 
      visit root_path
      click_link "sign up" 
      fill_in "user_username", with: user.username
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      fill_in "user_password_confirmation", with: user.password
      click_button "Sign up"
      expect( page.current_path ).to eq( root_path )
      expect( page ).to have_content("Welcome! You have signed up successfully.")
    end

  end

  context "unsuccessful sign up" do 

    before do
      visit root_path
      click_link "sign up" 
    end

    it "requires a correct a email" do
      fill_in "user_username", with: "#{Faker::Name.name}"
      fill_in "user_email", with: "notarealemail"
      fill_in "user_password", with: "Bookmarksforever"
      fill_in "user_password_confirmation", with: "Bookmarksforever"
      click_button "Sign up"
      expect( page ).to have_content("Please review the problems below:")
    end

    it "requires a correct password" do
      fill_in "user_username", with: "#{Faker::Name.name}"
      fill_in "user_email", with: "#{Faker::Internet.email}"
      fill_in "user_password", with: "Book"
      fill_in "user_password_confirmation", with: "Book"
      click_button "Sign up"
      expect( page ).to have_content("Please review the problems below:")
    end

    it "requires a username" do
      fill_in "user_username", with: nil
      fill_in "user_email", with: "#{Faker::Internet.email}"
      fill_in "user_password", with: "Book"
      fill_in "user_password_confirmation", with: "Book"
      click_button "Sign up"
      expect( page ).to have_content("Please review the problems below:")
    end

  end

end