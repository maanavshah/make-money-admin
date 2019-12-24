class CreateAppConfig < ActiveRecord::Migration[5.1]
  def change
    create_table :app_configs do |t|
      t.string :key, null: false
      t.string :value, null: false
    end
  end
end
