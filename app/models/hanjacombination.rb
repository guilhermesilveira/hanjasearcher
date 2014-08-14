class Hanjacombination < ActiveRecord::Base
	def encoded
		URI::encode(name)
	end
end
