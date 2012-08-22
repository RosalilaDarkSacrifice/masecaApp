class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :nombre
      t.string :identidad
      t.string :edad
      t.string :producto
      t.string :codigo

      t.timestamps
    end
  end
end
