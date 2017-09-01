class Account < ApplicationRecord
	has_many :transactions
	validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true

end
