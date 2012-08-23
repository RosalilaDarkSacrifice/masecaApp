class Ganador < ActiveRecord::Base
  attr_accessible :id_participante
  def getGanadorData
    @ganador = Participant.find(self.id_participante)
    return @ganador
  end
end
