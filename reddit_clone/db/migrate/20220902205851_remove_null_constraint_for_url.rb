class RemoveNullConstraintForUrl < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :url
    add_column :posts, :url, :string
  end
end
