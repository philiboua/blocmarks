class Bookmark < ActiveRecord::Base

  #database relation 
  belongs_to :topic
  belongs_to :user

  #database validation
  validates_presence_of :url

end
