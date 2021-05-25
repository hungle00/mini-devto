class AddPublishedToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :published, :boolean, default: false
    remove_column :articles, :description
  end
end
