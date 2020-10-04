class Api::V1::MessagesController < ActionController::Base
  before_action :find_channel

  def index
    @messages = @channel.messages
    render json: @messages
  end

  def create
    message = @channel.messages.build(message_params)
    message.user = current_user
    message.save
    render json: message # see Message.as_json method
  end

  def find_channel
    @channel = Channel.find_by_name(params[:channel_name])
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
