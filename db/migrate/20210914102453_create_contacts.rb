class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :nickname, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.text :subject, null: false
      t.text :message, null: false



      t.timestamps
    end
  end
end
