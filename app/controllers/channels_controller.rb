class ChannelsController < ApplicationController
  validates :name, presence: true, uniqueness: true
end
