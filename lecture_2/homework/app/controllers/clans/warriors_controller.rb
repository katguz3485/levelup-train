# frozen_string_literal: true

module Clans
  class WarriorsController < ApplicationController
    def create
      warrior = clan.warriors.new(samurai_params)
      if warrior.save
        render json: warrior.to_json(only: WARRIORS_FEATURES), status: 201
      else
        render json: { errors: warrior.errors.full_messages }, status: 422
      end
    end

    def index
      render json: set_warriors.to_json(only: WARRIORS_FEATURES)
    end

    def show
      render json: warrior.to_json(only: WARRIORS_FEATURES)
    end

    def update
      if clan.samurai.update!(samurai_params)
        render json: warrior.to_json(only: WARRIORS_FEATURES), status: 201
      else
        render json: { errors: warrior.errors.full_messages }, status: 422
      end
    end

    def delete
      warrior.destroy!
      head 204
    end

    private

    WARRIORS_FEATURES = %i[name shield_quality number_of_battles join_date death_date type].freeze

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
                   clan.warriors.dead
                 elsif params[:alive]
                   clan.warriors.alive
                 else
                   clan.warriors
                 end
      warriors
    end
  end
end
