class CreateConversions < ActiveRecord::Migration[6.1]
  def change
    create_table :conversions do |t|
      t.string :from
      t.string :to
      t.decimal :rate, null: true

      t.timestamps
    end
  end
end
