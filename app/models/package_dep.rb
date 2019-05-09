# frozen_string_literal: true

# Dependency for a Townnews Package. Each dependency consists of a package name and a
# version.
class PackageDep < ApplicationRecord
  belongs_to :package
end
