# frozen_string_literal: true

# A common abstract base for all our models. So far does nothing.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
