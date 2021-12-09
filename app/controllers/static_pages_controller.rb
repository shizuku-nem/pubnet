class StaticPagesController < ApplicationController
  def home
    if current_user  && current_user.is_admin
      redirect_to '/users'
    end
  end
end
