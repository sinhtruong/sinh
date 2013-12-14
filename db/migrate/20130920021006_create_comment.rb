class CreateComment < ActiveRecord::Migration
  def up
  	create_table :comments do |t|
  		t.text :body
  		t.references :user
  		t.references :post

  		t.timestamps

  	end
  	add_index :comments, :Post_id
  end

  def down
  end
end
