class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.string :name,              null: false, default: ""
      t.string :description,              null: false, default: ""
      t.belongs_to :user, index: true
      t.string :photo, null: false
      t.timestamps
    end
  end
end
