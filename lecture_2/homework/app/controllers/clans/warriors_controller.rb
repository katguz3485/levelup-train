# frozen_string_literal: true

module Clans
  class WarriorsController < ApplicationController
    def create
      warrior = clan.warriors.new(samurai_params)
      if warrior.save
        render json: serializer(warrior), status: 201
      else
        render json: {errors: serializer(warrior).errors.full_messages}, status: 422
      end
    end

    def index
      render json: set_warriors

    end

    def show
      render json: serializer(warrior)
    end

    def update
      if clan.samurai.update!(samurai_params)
        render json: serializer(warrior), status: 201
      else
        render json: {errors: serializer(warrior).errors.full_messages}, status: 422
      end
    end

    def delete
      warrior.destroy!
      head 204
    end

    private

    WARRIORS_FEATURES = %i[name shield_quality number_of_battles join_date death_date type defensible_type defensible_id offensible_type offensible_id].freeze

    def warrior_params
      params.require(:warrior).permit(WARRIORS_FEATURES)
    end

    def warrior
      @warrior ||= clan.warriors.find(params[:id])
    end

    def clan
      @clan ||= Clan.find(params[:clan_id])
    end

    def set_warriors
      warriors = if params[:dead]
                   serializer(clan.warriors.dead)
                 elsif params[:alive]
                   serializer(clan.warriors.alive)
                 else
                   serializer(clan.warriors)
                 end
     warriors
    end

    def serializer(serialized_object)
      WarriorSerializer.new(serialized_object)
    end

  end
end
