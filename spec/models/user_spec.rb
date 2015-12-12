require 'rails_helper'

RSpec.describe User, type: :model do
  
  it { should have_many(:topics) }
  it { should have_many(:bookmarks) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:encrypted_password) }

end
