class WarriorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :shield_quality, :number_of_battles, :join_date, :death_date, :type
  belongs_to :clan
  belongs_to :defensible
  has_one :weapon


end
