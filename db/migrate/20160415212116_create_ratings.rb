class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :book, index: true, foreign_key: true
      t.integer :score

      t.timestamps null: false
    end
  end
end
