class ToppagesController < ApplicationController
  def index
    @items = current_user.items.order('updated_at DESC')
  end
end
