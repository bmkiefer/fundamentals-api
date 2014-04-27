class AddFormatAndExpDate < ActiveRecord::Migration
  def change
    add_column :content_elements, :format_id, :integer
    add_column :content_elements, :expiration_date, :date
  end
end
