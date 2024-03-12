class CreateCostumes < ActiveRecord::Migration[7.1]
  def change
    create_table :costumes do |t|
      t.string :name
      t.string :category
      t.string :size
      t.string :material
      t.text :description
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
