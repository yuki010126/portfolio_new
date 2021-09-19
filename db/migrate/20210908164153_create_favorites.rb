class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :customer, foreign_key: true
      t.references :chat, foreign_key: true


      t.timestamps
    end
  end
end
