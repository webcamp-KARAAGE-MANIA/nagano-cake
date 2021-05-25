class AddNameToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :name, :string
    add_column :customers, :surname, :string
    add_column :customers, :surname_kana, :string
    add_column :customers, :name_kana, :string
    add_column :customers, :postal_code, :string
    add_column :customers, :phone_number, :string
    add_column :customers, :address, :text
    add_column :customers, :is_delete, :boolean, default: false
  end
end
