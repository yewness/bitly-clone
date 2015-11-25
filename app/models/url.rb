# require_relative '../../config/environments/init'
# require 'securerandom'
class Url < ActiveRecord::Base
	before_create :shorten

	def shorten
		self.short_url = SecureRandom.hex(3)
	end

	# 	# array = Array.new(8){ [*'0'..'9',*'A'..'Z',*'a'..'z'].sample }.join

end

