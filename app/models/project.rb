class Project < ApplicationRecord
  has_and_belongs_to_many :teams
  has_many :tasks, dependent: :destroy
  validates :name, presence: true
end
