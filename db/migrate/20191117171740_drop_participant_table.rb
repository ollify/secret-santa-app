class DropParticipantTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :participants
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
