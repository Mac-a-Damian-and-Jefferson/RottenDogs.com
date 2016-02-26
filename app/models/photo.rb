require 'httparty'
require 'flickraw'
require 'byebug'

class Photo
  def initialize
    FlickRaw.api_key="#{ENV['FLICKR_KEY']}"
    FlickRaw.shared_secret="#{ENV['FLICKR_SECRET']}"

    flickr = FlickRaw::Flickr.new

    list   = flickr.people.getPhotos(:user_id => "140515576@N07",
                                     :tags => "seriousdog")

    random = rand(list.length)

    farm = list[random].farm
    server = list[random].server
    id     = list[random].id
    secret = list[random].secret

    info = flickr.photos.getInfo :photo_id => id, :secret => secret

    picture_link = "https://farm#{farm}.staticflickr.com/#{server}/#{id}_#{secret}.jpg"

  end
end


photo = Photo.new
