# frozen_string_literal: true

# Properties for a package. Any key-value pair except those that have their own field in the
# Package model.
class PackageProp < ApplicationRecord
  validates :key, presence: true, uniqueness: { scope: :package }

  belongs_to :package
end
