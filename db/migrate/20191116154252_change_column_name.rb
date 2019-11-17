class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :participants, :user_id, :receiver_id
  end
end
