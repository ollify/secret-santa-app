class DeleteColumnAndAddColumnToGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :status
    change_table :groups do |t|
      t.string :status
    end
  end
end
