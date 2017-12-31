class WelcomeController < ApplicationController
  layout('unauthenticated')
  def index
    @posts = Post.published.limit(3).order("created_at desc")
  end
end
