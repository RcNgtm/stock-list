class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string     :product, null:false
      t.references :detail, null: false, foreign_key: true
      t.timestamps
    end
  end
end
