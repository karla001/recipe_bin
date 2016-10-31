class CreateTimeFrames < ActiveRecord::Migration
  def change
    create_table :time_frames do |t|
      t.string :date
      t.float :approx_price
      t.text :description
      t.boolean :public

      t.timestamps null: false
    end
  end
end
