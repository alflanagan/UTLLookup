class UtlFilesController < ApplicationController
  def index
    @active_sites = TownnewsSite.all
  end
end
