Rails.application.routes.draw do
  root 'blog_posts#index'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_up: 'signup' }
  get 'logout', to: 'pages#logout', as: 'logout'

  resources :subscribe, only: [:index]
  resources :dashboard, only: [:index]
  resources :account, only: [:index, :update]
  resources :billing_portal, only: [:new, :create]
  resources :blog_posts, controller: :blog_posts, path: "blog", param: :slug

  # static pages
  pages = %w[
    privacy terms
  ]

  pages.each do |page|
    get "/#{page}", to: "pages##{page}", as: page.gsub('-', '_').to_s
  end

  get '/blog/approve/:id' => 'blog_posts#approve', as: 'approve_blog_post'
  get '/blog/assign/:id' => 'blog_posts#assign', as: 'assign_blog_post'
  get '/blog/publish/:id' => 'blog_posts#publish', as: 'publish_blog_post'
  get '/artigos' => 'blog_posts#artigos', as: 'artigos'
  get '/review' => 'blog_posts#review', as: 'review'
  get '/write' => 'blog_posts#write', as: 'write'
  post '/invite' => 'admin/users#invite', as: 'invite'
  post '/grades/:id' => 'blog_posts#review_grade', as: 'review_grade'

  # admin panels
  authenticated :user, ->(user) { user.admin? } do
    namespace :admin do
      resources :dashboard, only: [:index]
      resources :impersonations, only: [:new]
      resources :users, only: [:edit, :update, :destroy]
    end

    # convenience helper
    get 'admin', to: 'admin/dashboard#index'
  end
end
