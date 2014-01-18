class CreateChatlogs < ActiveRecord::Migration
  def change
    create_table :chatlogs do |t|
      t.string :name
      t.string :content
      t.string :place
      t.datetime :spoken_time

      t.timestamps
    end
  end
end
