class CreateHashtagposts < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtagposts do |t|
      t.integer :discussion_id
      t.references :hashtag_id, index: true, foreign_key: true
      t.timestamps
    end
  end
end

