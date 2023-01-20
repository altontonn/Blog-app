class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.datetime :CreatedAt
      t.datetime :UpdatedAt

      t.timestamps
    end
  end
end
