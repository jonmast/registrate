@initMap = ->
  bounds = new google.maps.LatLngBounds()
  map = new google.maps.Map(document.getElementById('map'))
  $.getJSON '/users/locations', (locations)->
    locations.forEach (location)->
      marker = new google.maps.Marker
        map: map,
        position: {lat: location[1], lng: location[2]},
        title: location[0]
      bounds.extend(marker.position)
      map.fitBounds(bounds)
