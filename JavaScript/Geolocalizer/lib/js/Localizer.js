var Localizer = function() {
  this.setInitialListeners();
}

Localizer.prototype.setInitialListeners = function() {
  var location = this;
  $('#where-am-i').on('click', this.getLocation);
}

Localizer.prototype.getLocation = function() {
  navigator.geolocation.getCurrentPosition(onLocation, onError, {enableHighAccuracy: true});

    function onLocation(position) {
      $('#location').html("Getting location");
      var current = position.coords.latitude + ',' + position.coords.longitude;
      window.sessionStorage.setItem("position", current);
      printInfo(position);
    }

    function printInfo(position) {
      $('#location').html("");
      $('#map').html("");
      $('#location').append('Current location is Lat : ' + position.coords.latitude + ', Lon: ' + position.coords.longitude);
      var newMap = new ImageDisplayer().displayMap(position.coords.latitude, position.coords.longitude);
    }

    function onError(error) {
      console.log("Getting location failed: " + error);
    }
}
