# frozen_string_literal: true

class ApplicationSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
end
