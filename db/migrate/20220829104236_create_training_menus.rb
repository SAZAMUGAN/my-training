class CreateTrainingMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :training_menus do |t|

      t.timestamps
    end
  end
end
