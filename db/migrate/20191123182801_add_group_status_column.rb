class AddGroupStatusColumn < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :status
    end
  end
end
