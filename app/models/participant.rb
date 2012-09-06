class Participant < ActiveRecord::Base
  attr_accessible :codigo, :ciudad, :identidad, :nombre, :producto
	validates_presence_of :codigo, :ciudad, :identidad, :nombre, :producto
	validates_uniqueness_of :codigo
	validates_length_of :identidad, :minimum => 13, :maximum => 13
end
