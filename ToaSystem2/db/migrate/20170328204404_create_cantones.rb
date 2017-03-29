class CreateCantones < ActiveRecord::Migration[5.0]
  def change
    create_table :cantones do |t|
      t.string :nombre
      t.integer :provincia_id

      t.timestamps
    end
  end
end
