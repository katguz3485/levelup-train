# frozen_string_literal: true

class ClansController < ApplicationController
  def index
    clans = Clan.all
    render json: serializer(clans)
  end

  def create
    clan = Clan.new(clan_params)
    if clan.save
      render json: serializer(clan), status: 201
    else
      render json: { errors: serializer(clan).errors.full_messages }, status: 422
    end
  end

  private

  def clan_params
    params.require(:clan).permit(:name)
  end

  def serializer(obj_to_serialize)
    ClanSerializer.new(obj_to_serialize).serializable_hash
  end
end
