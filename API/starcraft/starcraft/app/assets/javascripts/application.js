// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$('form').on('submit', function(event) {
  event.preventDefault();
  $('#container').empty();
  id = $("input[name=player]").val();
  var request = $.get('/api/v1/players/' + id);
  request.done(function(data) {
    templatePlayer(data);
  })
})

var templatePlayer = function(element) {
  var html = 'The name of this player is  : ';
  html += element.name + '\n';
  html += "<br>";
  html += 'His victory is : ';
  html += element.rating + '\n';
  $('#container').append(html);
}

$('#show_all').on('click', function(event) {
  event.preventDefault();
  showAllMatches();
})

var showAllMatches = function(data) {
  $('#container').empty();
  var request = $.get('/api/v1/matches/all');
  request.done(function(data) {
    data.forEach(function(element) {
      template(element);
    })
  })
}

var template = function(element) {
  var html = 'Battle number : ';
  html += element.id + '\n';
  html += '<br>Winner ID: ';
  html += element.winner_id + '\n<br>';
  html += 'Winner faction: ';
  html += element.winner_faction + '\n<br>';
  html += 'Loser faction: ';
  html += element.loser_faction + '\n<br>';
  html += 'Match duration: ';
  html += element.duration + '\n<br>';
  html += "<br>";
  $('#container').append(html);
}
