class FixUserColumnName < ActiveRecord::Migration
  def up
  	rename_column :posts, :User_id, :user_id
  end

  def down
  end
end
