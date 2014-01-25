class CreateRoomdata < ActiveRecord::Migration
  def change
    create_table :roomdata do |t|
      t.string :place
      t.string :dataname
      t.string :data

      t.timestamps
    end
  end
end
