class ChangeTypeNameToBillType < ActiveRecord::Migration[7.0]
  def change
    rename_column :bills, :type, :bill_type
    add_reference :bills, :employee, null: false, foreign_key: true
  end
end
