class CreateHanjacombinations < ActiveRecord::Migration
  def change
    create_table :hanjacombinations do |t|
      t.string :name
      t.timestamps
    end
  end
end
