class StaticPagesController < ApplicationController
  def home
    if current_user  && current_user.is_admin
      redirect_to '/users'
    elsif current_user
      redirect_to '/posts'
    else
    end
  end
end
