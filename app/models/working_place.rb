class WorkingPlace < ApplicationRecord
  validates :place,  presence: true
  validates :wage, presence: true
end
