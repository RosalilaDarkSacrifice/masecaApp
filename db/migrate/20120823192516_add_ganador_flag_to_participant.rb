class AddGanadorFlagToParticipant < ActiveRecord::Migration
  def change
    add_column :participants, :ganador_flag, :boolean
  end
end
