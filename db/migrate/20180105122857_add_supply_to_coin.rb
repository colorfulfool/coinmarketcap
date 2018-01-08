class AddSupplyToCoin < ActiveRecord::Migration[5.1]
  def change
    add_column :coins, :supply, :float
  end
end
