class AddCiudadToParticipant < ActiveRecord::Migration
  def change
    add_column :participants, :ciudad, :string
  end
end
