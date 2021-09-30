class CreatePriceAlerts < ActiveRecord::Migration[6.1]
  def change
    create_table :price_alerts do |t|
      t.string :name
      t.string :origin
      t.string :destiny
      t.string :travelClass
      t.numeric :price
      t.string :departure_date

      t.timestamps
    end
  end
end
