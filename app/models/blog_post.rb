class BlogPost < ApplicationRecord
  has_one_attached :cover_image
  after_create :update_draft_state
  has_rich_text :body
  validates :slug, uniqueness: true
  before_validation :generate_unique_slug
  validates_presence_of :title, :slug, :body, :description

  def to_param
    slug
  end

  private

  def update_draft_state
    update_columns(draft: true)
  end

  def generate_unique_slug
    if new_record? || slug_changed?
      base_slug = slug.blank? ? title.parameterize : slug
      other = self.class.where("slug LIKE ?", "#{base_slug}%")
      self.slug = if other.exists?
                    "#{base_slug}-#{other.count + 1}"
                  else
                    base_slug
                  end
    end
  end
end
