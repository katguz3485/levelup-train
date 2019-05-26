# frozen_string_literal: true

class ClansController < ApplicationController

  def index
    clans = Clan.all
    render json: clans.to_json
  end

  def create
    clan = Clan.new(clan_params)
    if clan.save
      render json: clan.to_json, status: 201
    else
      render json: {errors: clan.errors.full_messages}, status: 422
    end
  end

  private

  def clan_params
    params.require(:clan).permit(:name)
  end
end


# module Clans
#   class SamuraisController < ApplicationController
#
#     def create
#       samurai = clan.samurais.new(samurai_params)
#       if samurai.save
#         render json: samurai.to_json(only: SAMURAI_FEATURES), status: 201
#       else
#         render json: {:errors => samurai.errors.full_messages}, status: 422
#       end
#     end
#
#     def index
#       render json: set_samurais.to_json(only: SAMURAI_FEATURES)
#     end
#
#
#     def show
#       render json: samurai.to_json(only: SAMURAI_FEATURES)
#     end
#
#
#     def update
#       if clan.samurai.update!(samurai_params)
#         render json: samurai.to_json(only: SAMURAI_FEATURES), status: 201
#       else
#       end
#     end
#
#     def delete
#       samurai.destroy!
#       head 204
#     end
#
#     private
#
#     SAMURAI_FEATURES = %i[name shield_quality number_of_battles join_date death_date]
#
#     def samurai_params
#       params.require(:samurai).permit(SAMURAI_FEATURES)
#     end
#
#     def samourai
#       @samurai ||= clan.samurais.find(params[:id])
#     end
#
#
#     def clan
#       @clan ||= Clan.find(params[:clan_id])
#     end
#
#
#     def set_samurais
#       if params[:dead]
#         samurais = clan.samurais.dead
#       elsif params[:alive]
#         samurais = clan.samurais.alive
#       else
#         samurais = clan.samurais
#       end
#       samurais
#     end
#   end
# end