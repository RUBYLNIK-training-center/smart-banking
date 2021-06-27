class ChangeDecimalOptionsInCurrencies < ActiveRecord::Migration[6.1]
  def change
    change_column :currencies, :rate, :decimal, precision: 15, scale: 6
  end
end
