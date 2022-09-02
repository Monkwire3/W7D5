class CreateSubs < ActiveRecord::Migration[7.0]
  def change
    create_table :subs do |t|
      t.string :title, null: false, index: { unique: true }

      t.references :moderator, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
