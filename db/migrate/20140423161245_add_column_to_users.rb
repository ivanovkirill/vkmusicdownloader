class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :string
    add_column :users, :provider, :string
  end
end
