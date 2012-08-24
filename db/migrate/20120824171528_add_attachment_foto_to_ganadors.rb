class AddAttachmentFotoToGanadors < ActiveRecord::Migration
  def self.up
    change_table :ganadors do |t|
      t.has_attached_file :foto
    end
  end

  def self.down
    drop_attached_file :ganadors, :foto
  end
end
