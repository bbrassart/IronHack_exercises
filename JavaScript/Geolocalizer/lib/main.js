var getLocation = function() {
  $('#location').html("Getting location");
  navigator.geolocation.getCurrentPosition(onLocation, onError, options);
}

$('#where-am-i').on('click', getLocation);

var options = {
  enableHighAccuracy: true
};

var onError = function(error) {
  console.log("Getting location failed: " + error);
}

var emptyFields = function() {
  $('#location').html("");
  $('#map').html("");
}

var onLocation = function(position) {
  $('#location').html("Getting location");
  var current = position.coords.latitude + ',' + position.coords.longitude;
  window.sessionStorage.setItem("position", current);
  emptyFields();
  $('#location').append('Current location is Lat : ' + position.coords.latitude + ', Lon: ' + position.coords.longitude);
  displayMap(position.coords.latitude, position.coords.longitude);
}

var retrievePreviousLocation = function() {
  if ( !window.sessionStorage.getItem("position") ) {
    $('#location').html("Sorry, no last location available");
    return;
  }
  emptyFields();
  var savedPosition = window.sessionStorage.getItem("position").split(",");
  var savedLatitude = savedPosition[0];
  var savedLongitude = savedPosition[1];
  console.log("Position retrieved");
  $('#location').append('The previous location was Lat : ' + savedLatitude + ', Lon: ' + savedLongitude)
  displayMap(savedLatitude, savedLongitude);
}

$('#i-was-there').on('click', retrievePreviousLocation);

var displayMap = function(lat, lon) {
  var mapid = "mapbox.comic/";
  var accessToken = "pk.eyJ1IjoiYmJyYXNzYXJ0IiwiYSI6IjU2MTZjMjRmMjE2MmE4M2Q0OWEwMDVkYTc5YzM3M2Y3In0.V44T7lzZarK4_QwAwoEClw"
  var z = "16/";
  var width = "500x"
  var height = "500.";
  var format = "jpg90";
  var marker = "pin-l-telephone+482(" + lon + "," + lat + ")/";
  console.log(marker)
  var url = "https://api.mapbox.com/v4/" + mapid + marker + lon + "," + lat + "," + z + width + height + format + "?access_token=" + accessToken;
  $('#map').html("<img src=" + url + ">");
};



$('#clear-my-tracks').on('click', function(){
  emptyFields();
  window.sessionStorage.clear();
  console.log("Session storage cleared")
});
