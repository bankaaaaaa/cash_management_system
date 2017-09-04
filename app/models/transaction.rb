class Transaction < ApplicationRecord
	belongs_to :account

	def self.g_t transactions
		expence_total = 0
		expence = "false"
		credit = "false"
		credit_total = 0
		transactions.each do |t|
			if t.is_credit != "0"
				credit_total += t.price
				credit = "true"
			else
				expence_total += t.price
				expence = "true"
			end
		end

		return credit, credit_total, expence, expence_total
	end
end
