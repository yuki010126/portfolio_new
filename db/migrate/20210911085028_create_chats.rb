class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.string :title
      t.text :introduction
      t.integer :customer_id
      t.string :nickname


      t.timestamps
    end
  end
end
