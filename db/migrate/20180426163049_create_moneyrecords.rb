class CreateMoneyrecords < ActiveRecord::Migration[5.1]
  def change
    create_table :moneyrecords do |t|
      t.date :date
      t.boolean :credit, :default false
      t.text :desc
      t.float :amount
      t.float :total

      t.timestamps
    end
  end
end
