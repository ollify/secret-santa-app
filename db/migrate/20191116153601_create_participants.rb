class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :admin
      t.references :group, foreign_key: true
      t.references :participant, foreign_key: true

      t.timestamps
    end
  end
end
