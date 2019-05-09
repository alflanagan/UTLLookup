# frozen_string_literal: true

class Application < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
