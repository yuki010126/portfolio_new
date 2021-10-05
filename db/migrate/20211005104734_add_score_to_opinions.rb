class AddScoreToOpinions < ActiveRecord::Migration[5.2]
  def change
    add_column :opinions, :score, :decimal, precision: 5, scale: 3
  end
end
