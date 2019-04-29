class SamuraisController < ApplicationController

  def create

  end

  def index

  end


  def show

  end


  def update

  end

  def delete

  end

  private


  def samourai
    @samurai = clan.samourais.find(params[:id])
  end


  def clan
    @clan ||= Clan.find(params[:clan_id])
  end

  def samurai_params
    params.permit(:name, :shield_quality, :number_of_battles, :join_date, :death_date)

  end

end
