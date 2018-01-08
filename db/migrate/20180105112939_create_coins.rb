class CreateCoins < ActiveRecord::Migration[5.1]
  def change
    create_table :coins do |t|
      t.string :name
      t.string :ticker
      t.float :marketcap
      t.float :price

      t.timestamps
    end
  end
end
