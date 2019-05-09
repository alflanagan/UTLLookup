# frozen_string_literal: true

# Reference information for a macro definition in a specific UTL file.
class MacroDefinition < ApplicationRecord
  belongs_to :utlfile
  validates :name, :start, presence: true
  validates :start, uniqueness: { scope: :utl_file }
end
