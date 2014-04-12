class CreateContentElements < ActiveRecord::Migration
  def change
    create_table :content_elements do |t|
	t.string :name
	t.string :url
	t.references :user
	t.references :provider
    end
  end
end
