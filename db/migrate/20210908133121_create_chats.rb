class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.string :title
      t.text :introduction

      t.timestamps
    end
  end
end
