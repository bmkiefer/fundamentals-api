class AddExpDateAndExpDate < ActiveRecord::Migration
  def change
    remove_column :content_elements, :expiration_date
    add_column :subscribed_tos , :expiration_date, :date
    add_column :subscriptions, :hidden_flag, :boolean
  end
end
