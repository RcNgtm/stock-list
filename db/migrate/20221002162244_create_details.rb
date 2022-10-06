class CreateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|
      t.string     :reportname, null:false
      t.integer     :deadline, null:false
      t.timestamps
    end
  end
end
