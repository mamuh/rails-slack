class ChannelsController < ApplicationController
  def show
    @channel = Channel.find_by_name(params[:channel_name])
    # render json: @channel
  end
end
