class SamuraisController < ApplicationController

  def create
    samurai = clan.samurais.create!(samourai_params)
    render json: samurai.to_json(only: %w[name shield_quality number_of_battles join_date])
  end

  def index


  end


  def show
    render json: samurai.to_json(only: %w[name shield_quality number_of_battles join_date])
  end


  def update
    clan.samurai.update!(samurai_params)
    render json: samurai.to_json(only: %w[name shield_quality number_of_battles join_date])
  end

  def delete
    samurai.destroy!
    head 204
  end

  private


  def samourai
    @samurai ||= clan.samurais.find(params[:id])
  end


  def clan
    @clan ||= Clan.find(params[:clan_id])
  end

  def samurai_params
    params.permit(:name, :shield_quality, :number_of_battles, :join_date, :death_date)

  end

end
