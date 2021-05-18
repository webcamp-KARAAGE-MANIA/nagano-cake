class AddNameKanaToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :surname_kana, :string
  end
end
