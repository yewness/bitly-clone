require 'byebug'

class Url < ActiveRecord::Base
	before_create :shorten
	validates :short_url, uniqueness: true
	validates :long_url, presence: true, format: { :with => URI::regexp(%w(http https)), :message => "Valid URL required"}
	# validates :url, :format => URI::regexp(%w(http https))

	def shorten
		self.short_url = SecureRandom.hex(3)
	end
	# array = Array.new(8){ [*'0'..'9',*'A'..'Z',*'a'..'z'].sample }.join
	# def catch
	# 	if self.class.valid?
	# 		raise self.errors.messages
	# 	else
	# 		redirect "/"
	# 	end
	# end
end

