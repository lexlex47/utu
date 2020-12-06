class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.date :date
      t.float :open
      t.float :high
      t.float :low
      t.float :close
      t.bigint :volume
      t.bigint :cap
      t.belongs_to :currency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
