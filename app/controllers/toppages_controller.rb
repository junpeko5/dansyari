class ToppagesController < ApplicationController
  def index
    if current_user
      @items = current_user.items.order('updated_at DESC')
    end
  end
end
