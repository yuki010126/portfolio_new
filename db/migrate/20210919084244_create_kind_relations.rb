class CreateKindRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :kind_relations do |t|
     t.integer :kind_id
      t.integer :chat_id
      t.timestamps
    end
  end
end
