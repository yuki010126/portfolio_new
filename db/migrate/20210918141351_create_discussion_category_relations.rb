class CreateDiscussionCategoryRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :discussion_category_relations do |t|
      t.integer :discussion_id
      t.integer :category_id

      t.timestamps
    end
  end
end
