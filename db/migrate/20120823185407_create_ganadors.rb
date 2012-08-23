class CreateGanadors < ActiveRecord::Migration
  def change
    create_table :ganadors do |t|
      t.integer :id_participante

      t.timestamps
    end
  end
end
