class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :slug
      t.string :title
      t.text :description
      t.integer :order
      t.boolean :home_page

      t.timestamps null: false
    end
  end
end
