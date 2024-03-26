class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @blog_posts = BlogPost.all.where(draft: false)
  end
end
