class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :image
      t.string :url
      t.text :description
      t.string :slug
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
