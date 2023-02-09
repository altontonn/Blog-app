class AddDefaultToPostsCounter < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :PostsCounter, :integer, default: 0
  end
end
