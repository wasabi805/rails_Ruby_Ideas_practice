class User < ApplicationRecord
  #-----DO NOT CHANGE THE RELATIONS!!!---#
  #This is the set up for a many to may model---#
  #Direct from Secrets in platform---#
  has_secure_password
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :posts_liked, through: :likes, source: :post


  #----------Cached User's post count------------


  #----------------validations-------------------------
  #Login:

  validates :name, :alias, :email, :password, :presence => true, allow_blank: false
  validates :email, :alias, :uniqueness => true
end
