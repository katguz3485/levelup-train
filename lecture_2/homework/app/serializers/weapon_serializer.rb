# frozen_string_literal: true

class WeaponSerializer
  include FastJsonapi::ObjectSerializer
  attributes :range, :damage, :name, :kind
  belongs_to :warrior

end
