class FixColumNameInUsersTable < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.rename :name, :user_name
    end
  end
end
