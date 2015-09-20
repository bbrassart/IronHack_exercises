var PreviousLocation = function() {
  this.setInitialListeners();
}

PreviousLocation.prototype.setInitialListeners = function() {
  $('#i-was-there').on('click', this.retrievePreviousLocation.bind(this));
}

PreviousLocation.prototype.retrievePreviousLocation = function() {
  if ( !window.sessionStorage.getItem("position") ) {
    $('#location').html("Sorry, no last location available");
    return;
  }
  var savedPosition = window.sessionStorage.getItem("position").split(",");
  var savedLatitude = savedPosition[0];
  var savedLongitude = savedPosition[1];
  this.printInfo(savedLatitude, savedLongitude);
}

PreviousLocation.prototype.printInfo = function(latitude, longitude) {
  console.log("Position retrieved");
  $('#location').html("");
  $('#map').html("");
  $('#location').append('The previous location was Lat : ' + latitude + ', Lon: ' + longitude);
  var newMap = new ImageDisplayer().displayMap(latitude, longitude);
}
