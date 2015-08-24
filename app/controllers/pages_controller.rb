class PagesController < ApplicationController
  def home
		@posts = Post.published.limit(3).order("created_at desc")
  end
end
