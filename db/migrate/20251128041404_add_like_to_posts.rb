class AddLikeToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :like, :integer
  end
end
