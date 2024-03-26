class User < ApplicationRecord
  include Signupable
  include Onboardable
  include Billable

  scope :subscribed, -> { where.not(stripe_subscription_id: [nil, '']) }
  scope :reviewers, -> { where('permissions @> ARRAY[?]::varchar[]', ['review']) }

  def can_approve?
    permissions.include?('approve') || admin?
  end

  def can_create?
    permissions.include?('create')
  end

  def can_edit?
    permissions.include?('edit') || admin?
  end

  def can_edit_users?
    permissions.include?('edit_users') || admin?
  end

  def can_delete_users?
    permissions.include?('delete_users') || admin?
  end

  def can_publish?
    permissions.include?('publish') || admin?
  end

  def can_review?
    permissions.include?('review')
  end

  def admin?
    permissions.include?('admin')
  end

  def role
    return 'Admin' if admin?

    return 'Avaliador' if can_review?

    'Autor'
  end
end
