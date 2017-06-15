class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :body,              null: false, default: ""
      t.integer :rating,              null: false, default: ""
      t.belongs_to :user, index: true
      t.belongs_to :food, index: true

      t.timestamps
    end
  end
end
