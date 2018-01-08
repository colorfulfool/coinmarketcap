class AddMarkedToCoin < ActiveRecord::Migration[5.1]
  def change
    add_column :coins, :marked, :boolean, default: false
  end
end
