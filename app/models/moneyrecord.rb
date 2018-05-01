class Moneyrecord < ApplicationRecord
  validates :date, presence: true
  validates :desc, presence: true
  validates :amount, presence: true
  validates :total, presence: true
end
