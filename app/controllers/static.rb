# require 'byebug'
# byebug

get '/' do
  @urls = Url.all
  erb :"static/index"
  # create new short URL
end

post '/urls' do
	url = Url.create(long_url: params[:long_url])
	redirect "/"
	# url.update(short_url: url.shorten)
	# url.short_url = url.shorten
	# url.save

	# params[:email]
	# byebug
	# p params[:long_url]
	# a = params[:short_url]
	# a.save
	#type a new URL
	#try to assign new URL to the short URL
	# Do something processing with URL
	# redirect to '/:short_url'

end

get '/about_me' do
	puts "hi"
	redirect "/"

end

get '/:short_url' do
	
	url = Url.find_by(short_url: params[:short_url])
	
	unless url.nil?
		redirect url.long_url
	else
		redirect "/"
	end
end