class CreateMinimumPrices < ActiveRecord::Migration[6.1]
  def change
    create_table :minimum_prices do |t|
      t.string :date
      t.string :schedule
      t.string :travel_class
      t.integer :price
      t.string :bus_operator
      t.integer :id_alert_price
      
      t.timestamps
    end
  end
end
