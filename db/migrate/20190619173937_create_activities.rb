class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :location
      t.integer :distance
      t.integer :hour
      t.integer :minute
      t.integer :calories
      t.string :comment
      t.references :user, foreign_key: true
      t.references :exercise, foreign_key: true

      t.timestamps
    end
  end
end
