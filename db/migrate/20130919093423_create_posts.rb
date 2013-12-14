class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.references :User

      t.timestamps
    end
    add_index :posts, :User_id
  end
end
