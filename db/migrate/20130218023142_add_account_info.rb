class AddAccountInfo < ActiveRecord::Migration
  def change
    add_column :users, :credit_card_number, :string
    add_column :users, :csc, :integer
    add_column :users, :expiration_date, :date
    add_column :users, :admin_flag, :boolean
    add_column :users, :content_manager_flag, :boolean
  end
end
