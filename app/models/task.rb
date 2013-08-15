class Task < ActiveRecord::Base
  belongs_to :project
  acts_as_list scope: :project

  validates :name, presence: true
  with_options if: -> { name.present? } do
    validates :name, uniqueness: { :scope => :project_id }
  end

  default_scope        -> { order('tasks.position DESC') }
  scope :recent_first, -> { order('tasks.created_at DESC') }
end
