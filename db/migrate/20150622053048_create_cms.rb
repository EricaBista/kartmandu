class CreateCms < ActiveRecord::Migration
  def change
    create_table :cms do |t|
      t.string :terms_of_use
      t.string :contact_us
      t.string :cash_on_delivery
      t.string :free_shipping
      t.string :privacy
      t.string :policy
      t.string :blog
      t.string :need_
      t.string :help

      t.timestamps null: false
    end
  end
end
