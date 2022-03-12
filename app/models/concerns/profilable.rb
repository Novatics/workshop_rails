module Profilable
  extend ActiveSupport::Concern

  included do
    scope :ativos, -> { where(active: true) }
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
