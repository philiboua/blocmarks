require 'rails_helper'

RSpec.feature "User sign in " do 

  before do 
    visit root_path 
    click_link "sign in"
  end

  let(:user) { create(:user) }

  context "successful sign in" do 

    it "renders a confirmation message" do 
      fill_in "user_email", with: user.email 
      fill_in "user_password", with: user.password 
      click_button "Log in"
      expect( page ).to have_content("Signed in successfully.")
    end

  end

  context "unsuccessful sign in" do 

    it "requires correct email" do 
      fill_in "user_email", with: "notuseremail"
      fill_in "user_password", with: user.password 
      click_button "Log in"
      expect( page ).to have_content("Invalid email or password")
    end

    it "requires correct password" do 
      fill_in "user_email", with: user.email
      fill_in "user_password", with: "notuserpassword" 
      click_button "Log in"
      expect( page ).to have_content("Invalid email or password")
    end

  end



end 