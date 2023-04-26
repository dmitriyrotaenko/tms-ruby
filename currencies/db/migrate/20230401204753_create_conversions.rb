class CreateConversions < ActiveRecord::Migration[6.1]
  def change
    create_table :conversions do |t|
      t.string :from
      t.string :to
      t.decimal :rate

      t.timestamps
      add_index :conversions, %i[from to]
    end
  end
end
