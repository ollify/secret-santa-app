class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :participants, :participant_id, :receiver_id
  end
end
