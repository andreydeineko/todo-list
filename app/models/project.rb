class Project < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_many   :tasks

  # Validations
  validates :name, presence: true

  with_options if: -> { name.present? } do
    # We don't want extra errors
    validates :name, uniqueness: true
  end

  scope :recent_first, -> { order('projects.created_at DESC') }
end
