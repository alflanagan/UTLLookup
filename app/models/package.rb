# frozen_string_literal: true

class Package < ApplicationRecord
  validates :name, :version, :application, :last_download, :pkg_type, presence: true
  has_one :application
  belongs_to :townnewssite
end
