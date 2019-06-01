# frozen_string_literal: true

require 'pry'

class MercenariesController < ApplicationController
  def index
    mercenaries = Mercenary.available
    render json: serializer(mercenaries)
  end

  def show
    render json: serializer(mercenary)
  end

  def employ_best
    mercenary = Mercenary.cheapest.first
    # warrior = WarriorRecruiter.new(mercenary: mercenary, params: mercenary_params).call
    # mercenary = Mercenary.where('available_from < ?', Time.now).order(price: :asc).first # TODO: what about experience?
    clan = find_clan
    building = find_building
    warrior_class = clan.warriors.select('type, count(type) as warriors_count').group(:type).order('warriors_count ASC').first.class
    warrior = warrior_class.create!(name: mercenary.name, clan: clan, building: building, preferred_weapon_kind: mercenary.preferred_weapon_kind, mercenary: mercenary)
    create_good_weapon(mercenary)
    binding.pry
    render json: serializer(warrior), include: [:mercenary], status: 201
  end

  def employ
    return unless mercenary.available_from < Time.now

    clan = find_clan
    building = find_building
    warrior_class = clan.warriors.select('type, count(type) as warriors_count').group(:type).order('warriors_count ASC').first.class
    warrior = warrior_class.create!(name: mercenary.name, clan: clan, building: building, preferred_weapon_kind: mercenary.preferred_weapon_kind, mercenary: mercenary)
    create_good_weapon(mercenary)
    # warrior = WarriorRecruiter.new(mercenary: mercenary, params: mercenary_params).call
    render json: serializer(warrior), status: 201
    # clan = find_clan
    # building = find_building
    # warrior_class = ClansQuery.warriors_class_select(clan: find_clan, relation: Clan)
    # warrior = warrior_class.create!(name: mercenary.name, clan: clan, building: building, preferred_weapon_kind: mercenary.preferred_weapon_kind, mercenary: mercenary)
  end

  def create_good_weapon(mercenary)
    WeaponCreator.new(mercenary: mercenary).call
  end

  private

  def mercenary
    @mercenary ||= Mercenary.find(params[:id])
  end

  def serializer(obj_to_serialize)
    MercenarySerializer.new(obj_to_serialize).serializable_hash
  end

  def mercenary_params
    params.permit(:clan_id, :building_id, :type)
  end

  def find_building
    Building.find(params[:building_id]) if params[:building_id]
  end

  def find_clan
    if params[:clan_id]
      Clan.find(params[:clan_id])
    else
      Clan.order(warriors_count: :desc).first
    end
  end
end
