# frozen_string_literal: true

class TownnewsSite < ApplicationRecord
  validates :URL, presence: true, uniqueness: true
  has_one :newspaper
end
