class AddHiddenFlags < ActiveRecord::Migration
  def change
    add_column :providers, :hidden_flag, :boolean
    add_column :content_areas, :hidden_flag, :boolean
    add_column :delivery_modes, :hidden_flag, :boolean
    add_column :formats, :hidden_flag, :boolean
    add_column :content_elements, :hidden_flag, :boolean
    remove_column :content_elements, :user_id
  end
end
