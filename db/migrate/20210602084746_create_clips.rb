class CreateClips < ActiveRecord::Migration[6.1]
  def change
    create_table :clips do |t|
      t.references :user, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
    add_index :clips, [:user_id, :article_id], unique: true
  end
end
