# frozen_string_literal: true

class Newspaper < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
