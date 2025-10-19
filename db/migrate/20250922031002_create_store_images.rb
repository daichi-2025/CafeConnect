class CreateStoreImages < ActiveRecord::Migration[6.1]
  def change
    create_table :store_images do |t|
      t.integer :store_id
      t.string :caption
      t.timestamps
    end
  end
end
