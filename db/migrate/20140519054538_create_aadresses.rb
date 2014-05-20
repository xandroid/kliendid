class CreateAadresses < ActiveRecord::Migration
  def change
    create_table :aadresses do |t|
      t.string :maja
      t.string :linn
      t.integer :user_id
      t.timestamps
    end
	add_index :aadresses, [:user_id, :created_at]
  end
end
