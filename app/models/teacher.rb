class Teacher < ApplicationRecord
  include Profilable

  has_many :students, through: :school_classes
  has_and_belongs_to_many :school_classes

  validates :first_name, :last_name, :expertise, presence: true
end
