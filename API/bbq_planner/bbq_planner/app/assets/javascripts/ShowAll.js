var ShowAll = function() {
  this.setInitalListeners();
  this.url = '/api/v1/barbecues/';
}

ShowAll.prototype.setInitalListeners = function() {
  var that = this;
  $('#showAll').on('click', function(event) {
    event.preventDefault();
    that.showAll();
  });
}

ShowAll.prototype.showAll = function() {
  var request = $.get(this.url);
  request.done(this.template.bind(this));
}

ShowAll.prototype.template = function(data) {
  console.log(data);
  $('#main').empty();
  $('#addNewItem').empty();
  $('#showAll').text("Show all");
  var html = '';
  if (data.unattended_barbecues.length > 0) {
    html += `<h1>BBQ's you're missing</h1>`
  };
  data.unattended_barbecues.forEach(function(item) {
    html += `<div class="line">${item.id} - ${item.title} will happen at ${item.venue}<button data-hook="showSpecificBarbecue" class="margin-left btn btn-success" data-id=${item.id}>See more</button> <button class="margin-left btn btn-success" data-id=${item.id} data-hook="join-bbq">
        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
        Join ${item.title}
      </button></div>`;
  });
  if (data.attended_barbecues.length > 0)  {
    html += `<h1>BBQ's you're attending</h1>`
  };
  data.attended_barbecues.forEach(function(item) {
    html += `<div class="line">${item.id} - ${item.title} will happen at ${item.venue}! You are already in!<button data-hook="showSpecificBarbecue" class="margin-left btn btn-success" data-id=${item.id}>See more</button>`;
  });
  $('#main').append(html);
}
