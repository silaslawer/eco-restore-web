# frozen_string_literal: true
class Entity < ApplicationRecord
  self.locking_column = :concurrency_id
  # validations
  validates_presence_of :entity_type, :data, :client_metadata
end
