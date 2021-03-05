class CommunitiesController < ApplicationController

  before_action :authenticate_account!, expect: [ :index, :show ]

  def index
    @communities = Community.all
  end

  def new

  end

  def create

  end

  def show

  end

end
