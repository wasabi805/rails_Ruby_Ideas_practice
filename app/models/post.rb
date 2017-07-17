class Post < ApplicationRecord
  #-----DO NOT CHANGE THE RELATIONS!!!---#
  #This is the set up for a many to may model---#
  belongs_to :user
  has_many :likes
  has_many :user_likes, through: :likes, source: :user

# ----- validations ----
#On create

  validates :content, presence: true, allow_blank: false
  validates_length_of :content, :minimum => 10

  # params['post']['content']

end
