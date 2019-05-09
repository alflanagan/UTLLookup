# frozen_string_literal: true

class Package < ApplicationRecord
  belongs_to :application
  belongs_to :townnewssite
end
