class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false, default:""
      t.text :body, null: false, default:""
      t.datetime :remember_created_at
      t.timestamps null: false
    end
  end
end
