class Topic < ActiveRecord::Base

  #database relations
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  #database validation
  validates_presence_of :title

end
