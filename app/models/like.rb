class Like < ApplicationRecord
  #-----DO NOT CHANGE THE RELATIONS!!!---#
  #This is the set up for a many to may model---#
  belongs_to :post, counter_cache: true
  belongs_to :user, counter_cache: true



end
