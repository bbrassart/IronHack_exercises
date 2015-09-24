var createCharacter = function() {
  var characterParams = $('form').serializeArray();
  $.post('https://ironhack-characters.herokuapp.com/characters', characterParams);
};

$('form').on('submit', function(event) {
  event.preventDefault();
  createCharacter();
});


var retrieveCharacters = function() {
  $.get('https://ironhack-characters.herokuapp.com/characters', function(data) {
    var characters = data;
    characters.forEach(function (character) {
      var html = '<br><li>Name :' + character.name + '<br>Occupation: ' + character.occupation + ' <br>Weapon: ' + character.weapon + '<br></li>';
      $('.js-character-list').append(html);
    })
  })
};

$('.js-characters').on('click', function(event) {
  event.preventDefault();
  $('.js-character-list').empty();
  retrieveCharacters();
});
