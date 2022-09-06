class CreateMenuRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_records do |t|
      t.date :date, null: false
      t.integer :form_level_id, null: false
      t.integer :weight
      t.integer :reps
      t.text :circuit_menus
      t.text :memo
      t.references :user, null: false, foreign_key: true
      t.references :training_menu, null: false, foreign_key: true
      t.timestamps
    end
  end
end
