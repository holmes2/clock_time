class CreateBreaks < ActiveRecord::Migration[7.0]
  def change
    create_table :breaks do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :active
      t.references :shift, null: false, foreign_key: true

      t.timestamps
    end
  end
end
