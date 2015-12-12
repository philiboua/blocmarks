class User < ActiveRecord::Base

  #devise modules for user
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #database relations 
  has_many :topics
  has_many :bookmarks

  #database validation
  validates_presence_of :email 
  validates_presence_of :encrypted_password 
  validates_presence_of :username

end
