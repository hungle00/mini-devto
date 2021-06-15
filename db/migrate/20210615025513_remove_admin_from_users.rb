class RemoveAdminFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :admin
  end
end
