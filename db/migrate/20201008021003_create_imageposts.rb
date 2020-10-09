class CreateImageposts < ActiveRecord::Migration[6.0]
  def change
    create_table :imageposts do |t|
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :imageposts, [:user_id, :created_at]
  end
end
