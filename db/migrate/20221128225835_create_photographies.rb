class CreatePhotographies < ActiveRecord::Migration[7.0]
  def change
    create_table :photographies do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
