# frozen_string_literal: true

class MacroRef < ApplicationRecord
  validates :start, :macro_name, presence: true

  belongs_to :utlfile
end
