class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :customer, foreign_key: true, null: false
      t.references :chat, foreign_key: true, null: false
      t.references :discussion, foreign_key: true, null: false

      t.timestamps
    end
  end
end
