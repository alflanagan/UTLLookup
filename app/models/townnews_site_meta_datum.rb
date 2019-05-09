# frozen_string_literal: true

class TownnewsSiteMetaDatum < ApplicationRecord
  validates :pkg_name, :version, :is_certified, :last_download, presence: true

  belongs_to :townnewssite
end
