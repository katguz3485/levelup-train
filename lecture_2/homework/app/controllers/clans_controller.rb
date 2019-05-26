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
      render json: { errors: clan.errors.full_messages }, status: 422
    end
  end

  private

  def clan_params
    params.require(:clan).permit(:name)
  end
end

