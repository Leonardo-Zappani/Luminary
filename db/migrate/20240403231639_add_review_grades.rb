# frozen_string_literal: true
class AddReviewGrades < ActiveRecord::Migration[7.1]
  def change
    add_column :blog_posts, :review_grades, :integer, array: true, default: []
  end
end
