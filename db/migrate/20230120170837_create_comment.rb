class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :Text
      t.datetime :UpdatedAt
      t.datetime :CreatedAt

      t.timestamps
    end
  end
end
