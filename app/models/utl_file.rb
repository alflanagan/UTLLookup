# frozen_string_literal: true

class UtlFile < ApplicationRecord
  validates :file_path, presence: true, uniqueness: { scope: :package }
  belongs_to :package
end
