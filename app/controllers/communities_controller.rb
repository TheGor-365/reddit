class CommunitiesController < ApplicationController

  before_action :authenticate_account!, expect: [ :index, :show ]
  before_action :set_community, only: [ :show ]

  def index
    @communities = Community.all
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    @community.account_id = current_account.id

    if @community.save
      redirect_to communities_path
    else
      render :new
    end
  end

  def show

  end

  private

  def set_community
    @community = Community.find(params[:id])
  end

  def community_params
    params.required(:community).permit(:name, :url, :rules)
  end

end