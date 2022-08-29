class CreateTrainingMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :training_menus do |t|
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :muscle_category_id ,null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
