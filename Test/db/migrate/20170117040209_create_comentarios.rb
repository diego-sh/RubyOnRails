class CreateComentarios < ActiveRecord::Migration[5.0]
  def change
    create_table :comentarios do |t|
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true
      t.text :cuerpo

      t.timestamps
    end
  end
end
