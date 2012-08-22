class Participant < ActiveRecord::Base
  attr_accessible :codigo, :edad, :identidad, :nombre, :producto
end
