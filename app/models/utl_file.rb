# frozen_string_literal: true

# Reference information regarding a specific file in the UTL templates directories. The
# utl_indexer process unpacks Townnews export files and builds the directory structures.
class UtlFile < ApplicationRecord
  validates :file_path, presence: true, uniqueness: { scope: :package }
  belongs_to :package
end
