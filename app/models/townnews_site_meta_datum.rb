# frozen_string_literal: true

# Additional information about the site, such as what packages are
# associated with it (even if they're not in database) and their last
# download times.
class TownnewsSiteMetaDatum < ApplicationRecord
  validates :pkg_name, :version, :is_certified, :last_download, presence: true

  belongs_to :townnewssite
end
