class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :name
      t.datetime :lasttime
      t.string :ip
      t.string :place

      t.timestamps
    end
  end
end
