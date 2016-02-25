require 'httparty'
require 'flickraw'
require 'byebug'

class Photo
  def initialize
    FlickRaw.api_key="#{ENV['FLICKR_KEY']}"
    FlickRaw.shared_secret="#{ENV['FLICKR_SECRET']}"

    byebug

    flickr = FlickRaw::Flickr.new

    token = flickr.get_request_token
    auth_url = flickr.get_authorize_url(token['oauth_token'], :perms => 'delete')

    puts "Open this url in your process to complete the authication process : #{auth_url}"
    puts "Copy here the number given when you complete the process."
    verify = gets.strip

    begin
      flickr.get_access_token(token['oauth_token'], token['oauth_token_secret'], verify)
      login = flickr.test.login
      puts "You are now authenticated as #{login.username} with token #{flickr.access_token} and secret #{flickr.access_secret}"
    rescue FlickRaw::FailedResponse => e
      puts "Authentication failed : #{e.msg}"
    end

    # list   = flickr.photos.getRecent
    #
    # id     = list[0].id
    # secret = list[0].secret
    # info = flickr.photos.getInfo :photo_id => id, :secret => secret
    #
    # puts info.title           # => "PICT986"
    # puts info.dates.taken     # => "2006-07-06 15:16:18"
    #
    # sizes = flickr.photos.getSizes :photo_id => id
    #
    # original = sizes.find {|s| s.label == 'Original' }
    # puts original.width       # => "800" -- may fail if they have no original marked image



    # @web_string = "https://$#{ENV['SHUTTER_KEY']}:$#{ENV['SHUTTER_SECRET']}@api.shutterstock.com/v2/images/search?query=donkey"
    # @results = HTTParty.get(@web_string)
    # p @results
  end
end


photo = Photo.new
