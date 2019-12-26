class AddCollectFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :coins_requested, :integer, default: 0, null: false
    add_column :users, :mobile_number, :string
  end
end
