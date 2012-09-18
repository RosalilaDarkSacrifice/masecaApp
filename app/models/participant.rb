class Participant < ActiveRecord::Base
  attr_accessible :codigo, :ciudad, :identidad, :nombre, :producto, :telefono
	validates_presence_of :codigo, :ciudad, :identidad, :nombre, :producto, :telefono
	# jajaja # validates_uniqueness_of :codigo
	validates_length_of :identidad, :minimum => 13, :maximum => 13
  validates_length_of :codigo, :minimum => 7, :maximum => 7
end
