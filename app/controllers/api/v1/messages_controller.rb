class Api::V1::MessagesController < ActionController::Base
  def index
    @messages = Message.all
    render json: @messages
  end

  def create
  end
end
