class ChannelsController < ApplicationController
  def show
    if params[:name].blank?
      redirect_to channel_path(Channel.first.name)
    else
      @channel = Channel.find_by_name(params[:name])
      # @channel = Channel.find_by(name: params[:id]) --> if the param was still called id
      @channels = Channel.all
    end
  end
end
