class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.decimal :amount
      t.string :type
      t.string :status
      t.integer :submitted_by

      t.timestamps
    end
  end
end
