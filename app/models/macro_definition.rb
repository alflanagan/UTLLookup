# frozen_string_literal: true

class MacroDefinition < ApplicationRecord
  belongs_to :utlfile
  validates :name, :start, presence: true
  validates :start, uniqueness: { scope: :utl_file }
end
