class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :referral_code, :string
    add_column :users, :coins, :integer, default: 0, null: false
    add_column :users, :disabled, :boolean, default: false, null: false
    add_column :users, :admin, :boolean, default: false, null: false
  end
end
