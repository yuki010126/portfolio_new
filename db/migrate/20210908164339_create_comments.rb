class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :nickname
      t.integer :chat_id
      t.integer :customer_id
      t.integer :discussion_id

      t.timestamps
    end
  end
end
