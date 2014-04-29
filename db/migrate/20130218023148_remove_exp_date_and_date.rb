class RemoveExpDateAndDate < ActiveRecord::Migration
  def change
    remove_column :users, :expiration_date
    add_column :users , :expiration_date, :string
    add_column :subscriptions, :days, :integer
    add_column :subscriptions, :months, :integer
    add_column :subscriptions, :years, :integer
  end
end
