class SchoolClass < ApplicationRecord
  has_many :students
  has_and_belongs_to_many :teachers

  validates :code, presence: true
  validates :code, uniqueness: true
  validates :code, length: { is: 6 }
end
