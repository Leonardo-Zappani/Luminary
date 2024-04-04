class AddReviewGrades2 < ActiveRecord::Migration[7.1]
  def change
    add_column :blog_posts, :weight_grade, :integer, array: true, default: []
  end
end
