require 'byebug'

get '/' do
  @urls = Url.all.order(click_counter: :desc)
  erb :"static/index"
end

# get '/' do
#   puts "[LOG] Getting /"
#   puts "[LOG] Params: #{params.inspect}"
#   erb :index
#  end


post '/urls' do
	url = Url.create(long_url: params[:long_url])
	redirect "/"
	# url.update(short_url: url.shorten)
	# url.short_url = url.shorten
	# url.save
end

get '/about_me' do
	redirect "/"
end

get '/:short_url' do
	url = Url.find_by(short_url: params[:short_url])
	
	unless url.nil?
		url.click_counter += 1
		url.save
		redirect url.long_url
	else
		redirect "/"
	end
end