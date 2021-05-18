class RemoveSurnameKanaFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :surname_kana, :string
  end
end
