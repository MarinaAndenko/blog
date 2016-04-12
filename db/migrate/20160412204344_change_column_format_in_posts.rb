class ChangeColumnFormatInPosts < ActiveRecord::Migration
  def up
  	change_column :posts, :description, :text
    change_column :posts, :text, :text
  end

  def down
  	change_column :posts, :description, :string
    change_column :posts, :text, :string
  end
end
