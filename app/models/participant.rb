class Participant < ActiveRecord::Base
  attr_accessible :codigo, :edad, :identidad, :nombre, :producto
	validates_presence_of :codigo, :edad, :identidad, :nombre, :producto
	validates_uniqueness_of :codigo
	validates_length_of :identidad, :minimum => 13, :maximum => 13
end
