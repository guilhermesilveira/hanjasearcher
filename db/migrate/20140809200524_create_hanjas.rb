class CreateHanjas < ActiveRecord::Migration
  def change
    create_table :hanjas do |t|
      t.string :name
      t.string :encoded

      t.timestamps
    end
  end
end
