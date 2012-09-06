class AddTelefonoToParticipant < ActiveRecord::Migration
  def change
    add_column :participants, :telefono, :string
  end
end
