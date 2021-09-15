class CreateOpinions < ActiveRecord::Migration[5.2]
  def change
    create_table :opinions do |t|
      t.text :content
      t.string :nickname
      t.integer :chat_id
      t.integer :customer_id
      t.integer :discussion_id

      t.timestamps
    end
  end
end
