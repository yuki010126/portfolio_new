class CreateCategoryes < ActiveRecord::Migration[5.2]
  def change
    create_table :categoryes do |t|
      t.string :category

      t.timestamps
    end
  end
end
