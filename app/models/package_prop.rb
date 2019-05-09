# frozen_string_literal: true

class PackageProp < ApplicationRecord
  validates :key, presence: true, uniqueness: { scope: :package }

  belongs_to :package
end
