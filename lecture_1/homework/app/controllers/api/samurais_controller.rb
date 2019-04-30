module Api
  class SamuraisController < ApplicationController

    def create
      samurai = clan.samurais.create!(samurai_params)
      render json: samurai.to_json(only: SAMURAI_FEATURES), status: 201
    end

    def index
      if params[:dead]
        samurais = clan.samurais.dead
      elsif params[:alive]
        samurais = clan.samurais.alive
      else
        samurais = clan.samurais
      end

      render json: samurais.to_json(only: SAMURAI_FEATURES)
    end


    def show
      render json: samurai.to_json(only:SAMURAI_FEATURES)
    end


    def update
      clan.samurai.update!(samurai_params)
      render json: samurai.to_json(only: SAMURAI_FEATURES)
    end

    def delete
      samurai.destroy!
      head 204
    end

    private

    SAMURAI_FEATURES = %i[name shield_quality number_of_battles join_date death_date]

    def samurai_params
      params.require(:samurai).permit(SAMURAI_FEATURES)
    end

    def samourai
      @samurai ||= clan.samurais.find(params[:id])
    end


    def clan
      @clan ||= Clan.find(params[:clan_id])
    end

    # def samurai_params
    #   params.permit(:name, :shield_quality, :number_of_battles, :join_date, :death_date)
    #
    # end

  end
end