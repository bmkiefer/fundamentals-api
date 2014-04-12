class AddSubscriptionId < ActiveRecord::Migration
  def change
    add_column :subscribed_tos, :subscriptiona_id, :integer
  end
end
