class Ganador < ActiveRecord::Base
  attr_accessible :id_participante, :foto
  has_attached_file :foto, :dependent => :destroy
  #, :styles => { :medium => "300x300>" }
  def getGanadorData
    @ganador = Participant.find(self.id_participante)
    return @ganador
  end
end
