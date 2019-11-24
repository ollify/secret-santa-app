class AddUserStatusToUserModel < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :user_status
    end
  end
end
