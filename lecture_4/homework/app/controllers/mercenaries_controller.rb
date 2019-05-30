require 'pry'
# This controller is written badly on purpose. Please refactor this
#
class MercenariesController < ApplicationController


  def index
    render json: serializer(Mercenary.available), status: 201
  end

  def show
    render json: serializer(mercenary)
    # include: [:warrior]
  end

  def employ_best
    mercenary = Mercenary.cheap_and_experienced


    # mercenary = Mercenary.where('available_from < ?', Time.now).order(price: :asc).first # TODO: what about experience?
    clan = find_clan
    building = find_building
    warrior_class = clan.warriors.select('type, count(type) as warriors_count').group(:type).order('warriors_count ASC').first.class
    warrior = warrior_class.create!(name: mercenary.name, clan: clan, building: building, preferred_weapon_kind: mercenary.preferred_weapon_kind, mercenary: mercenary)
    create_good_weapon(mercenary)
    render json: warrior, include: [:mercenary], status: 201
  end

  def employ
    return unless mercenary.available_from < Time.now

    clan = find_clan
    building = find_building
    warrior_class = ClansQuery.warriors_class_select(clan: find_clan, relation: Clan)
    warrior = warrior_class.create!(name: mercenary.name, clan: clan, building: building, preferred_weapon_kind: mercenary.preferred_weapon_kind, mercenary: mercenary)
    create_good_weapon(mercenary)
    render json: warrior, include: [:mercenary], status: 201
  end

  private

  def mercenary
    @mercenary ||= Mercenary.find(params[:id])
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

  def create_good_weapon(mercenary)
    WeaponCreator.new(mercenary: mercenary).call
  end

  def serializer(obj_to_serialize)
    MercenarySerializer.new(obj_to_serialize)
  end
end
