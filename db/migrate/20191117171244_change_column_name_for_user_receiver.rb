class ChangeColumnNameForUserReceiver < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :user_id, :receiver_id
  end
end
