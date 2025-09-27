class AddStoreIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :store_id, :integer
  end
end
