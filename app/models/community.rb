class Community < ApplicationRecord

  belongs_to :account
  validates_prsence_of :url, :name, :bio

end
