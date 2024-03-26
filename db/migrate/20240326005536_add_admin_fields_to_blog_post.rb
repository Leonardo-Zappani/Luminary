class AddAdminFieldsToBlogPost < ActiveRecord::Migration[7.1]
  def change
    add_column :blog_posts, :published, :boolean, default: false
    add_column :blog_posts, :reviewer, :string
  end
end
