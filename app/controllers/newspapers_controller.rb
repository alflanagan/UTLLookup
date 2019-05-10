# frozen_string_literal: true

# Controller for Newspaper model.
class NewspapersController < ApplicationController
  def index
    @papers = Newspaper.all
  end
end
