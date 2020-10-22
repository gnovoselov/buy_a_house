class MapsController < ApplicationController
  def index
    @markers = Gmaps4rails.build_markers(House.all) do |house, marker|
      marker.lat house.latitude
      marker.lng house.longitude
      marker.infowindow render_to_string(:partial => "/houses/info_window", locals: { house: house })
    end
  end
end
