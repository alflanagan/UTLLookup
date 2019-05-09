# frozen_string_literal: true

# Records a macro call in a specific UTL file.
class MacroRef < ApplicationRecord
  validates :start, :macro_name, presence: true

  belongs_to :utlfile
end
