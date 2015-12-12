require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  
  it { should belong_to(:user) }
  it { should belong_to(:topic) }
  it { should validate_presence_of(:url) }

end
