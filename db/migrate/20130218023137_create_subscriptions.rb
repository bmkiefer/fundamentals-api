class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
	t.string :name
	t.references :provider
    end
  end
end
