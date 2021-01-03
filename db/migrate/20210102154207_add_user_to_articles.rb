class AddUserToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :user, index: true, foreign_key: true
    add_index :articles, :slug, unique: true
  end
end
