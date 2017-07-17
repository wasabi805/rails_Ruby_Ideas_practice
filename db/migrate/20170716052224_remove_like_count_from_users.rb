class RemoveLikeCountFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :like_count, :integer
  end
end
