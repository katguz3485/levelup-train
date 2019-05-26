class WeaponSerializer
  include FastJsonapi::ObjectSerializer
  attributes :range, :damage, :name
  belongs_to :warrior

end
