class Student < ApplicationRecord
  include Profilable

  belongs_to :school_class
  has_many :teachers, through: :school_classes

  validates :first_name, :last_name, :email, :registration, presence: true
  validates_uniqueness_of :email, :registration
  validates :registration, numericality: { only_integer: true }

  def self.all_emails
    all.pluck(:email)
  end
end
