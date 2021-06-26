class Task < ApplicationRecord
  belongs_to :project
  has_and_belongs_to_many :users
  validates :project_id, presence: true
  validates :name, presence: true
end
