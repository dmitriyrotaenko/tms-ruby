class CreateJokes < ActiveRecord::Migration[6.1]
  def change
    create_table :jokes do |t|
      t.string  :text
      t.integer :category_id

      t.timestamps
    end
  end
end
