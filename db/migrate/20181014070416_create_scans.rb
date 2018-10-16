class CreateScans < ActiveRecord::Migration[5.1]
  def change
    create_table :scans do |t|
      t.string :_openid
      t.string :time
      t.string :rawData
      t.string :result
      t.float :alt
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
