# frozen_string_literal: true

require 'pry'

class MercenariesController < ApplicationController
  def index
    mercenaries = Mercenary.available
    render json: serializer(mercenaries, serializer_type: MercenarySerializer)
  end

  def show
    render json: serializer(mercenary)
  end

  def employ_best
    mercenary = Mercenary.cheapest
    warrior = WarriorRecruiter.new(mercenary: mercenary, params: mercenary_params).call
    render json: serializer(warrior, serializer_type: WarriorSerializer), include: [:mercenary], status: 201
  end

  def employ
    return unless mercenary.available_from < Time.now

    warrior = WarriorRecruiter.new(mercenary: mercenary, params: mercenary_params).call
    render json: serializer(warrior, serializer_type: WarriorSerializer), include: [:mercenary], status: 201
  end

  def create_good_weapon(mercenary)
    WeaponCreator.new(mercenary: mercenary).call
  end

  private

  def mercenary
    @mercenary ||= Mercenary.find(params[:id])
  end

  def serializer(obj_to_serialize, serializer_type:)
    serializer_type.new(obj_to_serialize).serializable_hash
  end

  def mercenary_serializer

  end

  def mercenary_params
    params.permit(:clan_id, :building_id, :type)
  end
end
