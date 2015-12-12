require 'rails_helper'

RSpec.feature "User sign out " do 

  let(:user) { create(:user) }

  before do 
    login_as(user, scope: :user)
    visit root_path
    click_link 'sign out'
  end 

  it "renders a flash message for confirmation " do 
    expect( page ).to have_content("Signed out successfully")
  end 

end