class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: %i[show edit update destroy]
  # before_action :authenticate_user!, only: %i[new create edit update destroy]

  # GET /blog_posts
  def index
   @blog_posts = BlogPost.all.order(created_at: :asc).where(published: true)
  end

  def artigos
    @blog_posts = BlogPost.all.order(created_at: :asc).where(draft: false)
  end

  def review
    @blog_posts = BlogPost.all.order(created_at: :asc).where(reviewer: current_user.name).where(draft: true)
  end

  def write
    @blog_posts = BlogPost.all.order(created_at: :asc)
  end

  def review_grade
    @blog_post = BlogPost.find(params[:id])
    review_grades = @blog_post.review_grades
    review_grades << params[:grade].to_i

    weight_grade = @blog_post.weight_grade
    weight_grade << params[:weight_grade].to_i
    @blog_post.update(review_grades: review_grades, weight_grade: weight_grade)

    redirect_to blog_posts_path
  end

  # GET /blog_posts/slug
  def show; end

  # GET /blog_posts/new
  def new
    @blog_post = BlogPost.new
  end

  # GET /blog_posts/slug/edit
  def edit; end

  def approve
    @blog_post = BlogPost.find(params[:id])
    @blog_post.update(draft: false)
    redirect_to blog_posts_path
  end

  def publish
    @blog_post = BlogPost.find(params[:id])
    @blog_post.update(published: true)
    redirect_to admin_dashboard_index_path
  end

  def assign
    @blog_post = BlogPost.find(params[:id])
    @blog_post.update(reviewer: params[:name])
    redirect_to blog_posts_path
  end

  # POST /blog_posts
  def create
    @blog_post = BlogPost.new(blog_post_params)

    if @blog_post.save
      redirect_to blog_post_path(@blog_post.slug), notice: "Blog post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blog_posts/slug
  def update
    @blog_post.slug = params[:blog_post][:slug]
    if @blog_post.save && @blog_post.update(blog_post_params)
      redirect_to blog_post_path(@blog_post.slug), notice: "Blog post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /blog_posts/1
  def destroy
    @blog_post.destroy
    redirect_to blog_posts_url, notice: "Blog post was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_blog_post
    slug = params[:blog_post].present? ? params[:blog_post][:slug] : params[:slug]
    @blog_post = BlogPost.find_by!(slug: slug)
  end

  # Only allow a list of trusted parameters through, but add :body, and use slug instead of id in the URL.
  def blog_post_params
    params.require(:blog_post).permit(:title, :slug, :description, :body, :cover_image, :draft, :name, :reviewer)
  end
end
