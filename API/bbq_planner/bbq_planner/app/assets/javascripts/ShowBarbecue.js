
var ShowBarbecue = function() {
  this.setInitialListeners();
  this.url = '/api/v1/barbecues/';
}

ShowBarbecue.prototype.setInitialListeners = function() {
  var that = this;
  $('#main').on('click', '[data-hook=showSpecificBarbecue]', function(event) {
    event.preventDefault();
    $('#showAll').val("Back to main");
    that.showBarbecue();
  });
}

ShowBarbecue.prototype.showBarbecue = function() {
  $('#showAll').text("Back to main");
  var bbqId = $(event.target).data('id');
  var request = $.get(this.url + bbqId);
  request.done(this.template.bind(this));
  request.fail(this.fail.bind(this));
}

ShowBarbecue.prototype.fail = function() {
  var htmlParts = [
    '<div class="alert alert-danger" role="alert">',
    '  There was a problem retrieving the BBQ info. Try again later.',
    '</div>'
  ]
  $('#main').append(htmlParts.join('\n'));
};

ShowBarbecue.prototype.template = function(data) {
  $('#main').empty();
  var html = '';
  html += `<h1>${data.barbecue.title}</h1>
    <p>This barbecue will happen in ${data.barbecue.venue}
    on the ${data.barbecue.date}</p>`

  if (data.users.length != 0) {
    html += '<h3>People attending</h3><ul>';
    data.users.forEach(function(user) {
      html += `<li>${user.email}</li>`
    })
    html += '</ul>';
  } else {
    html += '<h3>Nobody is attending the BBQ yet';
  }


  if (data.items.length != 0) {
    html += '<h3>Items</h3><ul>';
    data.items.forEach(function(item) {
      html += `<li>${item.product}</li>`
    })
    html += '</ul>';
  } else {
    html += '<h3>Nothing has been added yet</h3>';
  }
  $('#main').append(html);
  debugger;
  if (data.participating) {
    var addHTML = `<form id="itemForm" data-id=${data.barbecue.id}>
      <input type="text" placeholder="Your item here" name="item">
      <input type="submit">
      </form>`
  } else {
    var addHTML =`You cannot add items as you're not participating`
  }
  $('#addNewItem').empty();
  $('#addNewItem').append(addHTML);
};
