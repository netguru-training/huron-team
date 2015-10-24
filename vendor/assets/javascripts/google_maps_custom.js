function gmap_show(bar) {
  if ((bar.lat == null) || (bar.lng == null) ) {    // validation check if coordinates are there
    return 0;
  }

  handler = Gmaps.build('Google');    // map init
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers([    // put marker method
      {
        "lat": bar.lat,    // coordinates from parameter bar
        "lng": bar.lng,
        "picture": {    // setup marker icon
          "url": 'http://megaicons.net/static/img/icons_sizes/258/972/32/beer-icon.png',
          "width":  32,
          "height": 32
        },
        "infowindow": "<b>" + bar.name + "</b> " + bar.street + ", " + bar.city
      }
    ]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setZoom(12);    // set the default zoom of the map
  });
}

function gmap_form(bar) {
  handler = Gmaps.build('Google');    // map init
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    if (bar && bar.lat && bar.lng) {    // statement check - new or edit view
      markers = handler.addMarkers([    // print existent marker
        {
          "lat": bar.lat,
          "lng": bar.lng,
          "picture": {
            "url": 'http://megaicons.net/static/img/icons_sizes/258/972/32/beer-icon.png',
            "width":  32,
            "height": 32
          },
          "infowindow": "<b>" + bar.name + "</b> " + bar.street + ", " + bar.city
        }
      ]);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(12);
    }
    else {    // show the empty map
      handler.fitMapToBounds();
      handler.map.centerOn([52.10, 19.30]);
      handler.getMap().setZoom(6);
    }
  });

  var markerOnMap;

  function placeMarker(location) {    // simply method for put new marker on map
    if (markerOnMap) {
      markerOnMap.setPosition(location);
    }
    else {
      markerOnMap = new google.maps.Marker({
        position: location,
        map: handler.getMap()
      });
    }
  }

  google.maps.event.addListener(handler.getMap(), 'click', function(event) {    // event for click-put marker on map and pass coordinates to hidden fields in form
    placeMarker(event.latLng);
    document.getElementById("map_lat").value = event.latLng.lat();
    document.getElementById("map_lng").value = event.latLng.lng();
  });
}