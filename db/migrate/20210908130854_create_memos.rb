class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.string :memo_title
      t.text :memo_introduction

      t.timestamps
    end
  end
end
