class CreateTableros < ActiveRecord::Migration[7.0]
  def change
    create_table :tableros do |t|
      t.references :user, null: false, foreign_key: true
      t.references :photography, null: false, foreign_key: true

      t.timestamps
    end
  end
end
