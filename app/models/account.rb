class Account < ApplicationRecord
	has_many :transactions
	validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true

	def self.g_bill interval, month, year
		if month.to_i < 10
	      month = '0'+month
	    end

		pastYear = (year.to_i-1).to_s

	    if interval == "yearly"
		    to_date = year+'-'+month+'-'+'30'+' '+'00:00:00'
		    from_date = pastYear+'-'+month+'-'+'01'+' '+'00:00:00'
		    return to_date, from_date
		elsif interval == "quarterly"
	    	d = Time.new(year.to_i,month.to_i,30)
		end

	end

end
