class CreateTwidds < ActiveRecord::Migration
  def change
    create_table :twidds do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end
    add_index :twidds, :user_id
  end
end
