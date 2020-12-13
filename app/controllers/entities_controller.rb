# frozen_string_literal: true
class EntitiesController < ApplicationController
  def index
    @entities = Entity.all
  end
end
