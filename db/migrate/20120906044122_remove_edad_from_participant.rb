class RemoveEdadFromParticipant < ActiveRecord::Migration
  def up
    remove_column :participants, :edad
  end

  def down
    add_column :participants, :edad, :string
  end
end
