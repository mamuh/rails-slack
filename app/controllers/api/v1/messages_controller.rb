class Api::V1::MessagesController < ActionController::Base
  before_action :find_channel

  def index
    @messages = @channel.messages
    render json: @messages
  end

  def create
  end

  def find_channel
    @channel = Channel.find_by_name(params[:name])
  end
end
