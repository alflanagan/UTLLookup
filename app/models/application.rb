# frozen_string_literal: true

# A Townnews application, which is a group of related modules.
class Application < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
