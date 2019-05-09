# frozen_string_literal: true

# A Townnews website, referred to by its main URL and managed as a unit.
class TownnewsSite < ApplicationRecord
  validates :URL, presence: true, uniqueness: true
  has_one :newspaper
end
