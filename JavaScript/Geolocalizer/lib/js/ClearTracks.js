var ClearTracks = function() {
  this.setInitialListeners();
}

ClearTracks.prototype.setInitialListeners = function() {
  $('#clear-my-tracks').on('click', function(){
    emptyFields();
    window.sessionStorage.clear();
    console.log("Session storage cleared");

    function emptyFields() {
      $('#location').html("");
      $('#map').html("");
    }

  });
}
