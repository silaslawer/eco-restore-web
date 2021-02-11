# frozen_string_literal: true
class EntitiesController < ApplicationController
  #after_action :inject_definition

  def index
    @entities = Entity.where(entity_type: entity)
    inject_definition
  end

  def show
    @object = Entity.where(entity_type: entity, id: params.require(:id)).first
    not_found unless @object.present?
    inject_definition
  end

  private
    def entity
      params.require(:entity).to_sym
    end

    def inject_definition
      @entity = entity
      @definition = Rails.application.config.entity_definition
    end
end
