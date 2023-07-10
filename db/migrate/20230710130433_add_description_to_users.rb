class AddDescriptionToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :avatar, :string
    add_column :users, :about, :string
  end
end
