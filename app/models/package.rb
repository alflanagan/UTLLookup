# frozen_string_literal: true

# A Townnews package is a collection of files implementing functionality for a
# TownnewsSite.
#
# There are four types of packages: *global skins* contain customized files for a particular
# site. *skins* are bundles of functionality for a specific application. *components* are
# collections of macros for use by other packages. *blocks* are templates and associated files
# for a specific block type.
#
# Packages (except global skins) may be "certified" by Townnews: this means they contain only
# the files and code provided by Townnews, and therefore can be supported by them. Packages
# which are customized in some way are no longer "certified", and qualify for a lower level of
# support.
#
# This model contains fields for all the package types. Some fields don't apply to all types.
class Package < ApplicationRecord
  validates :name, :version, :application, :last_download, :pkg_type, presence: true
  has_one :application
  belongs_to :townnewssite
end
