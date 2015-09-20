var ImageDisplayer = function(){
}

ImageDisplayer.prototype.displayMap = function(lat, lon) {
  var mapid = "mapbox.comic/";
  var accessToken = "pk.eyJ1IjoiYmJyYXNzYXJ0IiwiYSI6IjU2MTZjMjRmMjE2MmE4M2Q0OWEwMDVkYTc5YzM3M2Y3In0.V44T7lzZarK4_QwAwoEClw"
  var z = "16/";
  var width = "500x"
  var height = "500.";
  var format = "jpg90";
  var marker = "pin-l-telephone+482(" + lon + "," + lat + ")/";
  var url = "https://api.mapbox.com/v4/" + mapid + marker + lon + "," + lat + "," + z + width + height + format + "?access_token=" + accessToken;
  $('#map').html("<img src=" + url + ">");
};
