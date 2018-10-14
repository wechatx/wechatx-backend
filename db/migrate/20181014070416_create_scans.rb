class CreateScans < ActiveRecord::Migration[5.1]
  def change
    create_table :scans do |t|
      t.string :_id
      t.string :_openid
      t.string :time
      t.string :charSet
      t.string :rawData
      t.string :result
      t.string :scanType
      t.float :accuracy
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
