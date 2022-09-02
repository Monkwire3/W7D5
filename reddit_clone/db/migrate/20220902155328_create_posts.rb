class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :body
      t.string :url, null: false, index: { unique: true }

      t.references :poster, foreign_key: { to_table: :users }
      t.references :sub, foreign_key: { to_table: :subs }

      t.timestamps
    end
  end
end
