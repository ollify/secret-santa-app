class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :admin
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
