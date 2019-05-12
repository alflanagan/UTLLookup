# frozen_string_literal: true

# The newspaper organization associated with a site.
class Newspaper < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :townnews_sites
end
