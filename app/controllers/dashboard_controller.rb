class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @blog_posts = BlogPost.all.where(published: true)
  end
end
