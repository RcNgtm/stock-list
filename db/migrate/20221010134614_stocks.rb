class Stocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.date      :movedate, null: false
      t.integer   :num, null: false
      t.references :user, null: false, foreign_key: true
      t.references :report, null: false, foreign_key: true
      t.timestamps
    end
  end
end
