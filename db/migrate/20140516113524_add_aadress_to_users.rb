class AddAadressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :aadress, :string
  end
end
