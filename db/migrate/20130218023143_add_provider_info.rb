class AddProviderInfo < ActiveRecord::Migration
  def change
    add_column :providers, :content_area_id, :integer
    add_column :providers, :delivery_mode_id, :integer
  end
end
