class PagesController < ApplicationController
  def about
  end

  def home
    @pagy, @posts = pagy(Post.all.order("created_at DESC"))
  end

  def welcome
  end
end
