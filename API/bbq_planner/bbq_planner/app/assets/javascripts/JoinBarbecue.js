
var JoinBarbecue = function() {
  this.setInitialListeners();
  this.url = '/api/v1/barbecues/join';
}

JoinBarbecue.prototype.setInitialListeners = function() {
  var that = this;
  $('#main').on('click', '[data-hook=join-bbq]', function (event) {
    event.preventDefault();
    that.joinBarbecue();
  });
}

JoinBarbecue.prototype.joinBarbecue = function() {
  var bbqId = $(event.target).closest('[data-id]').data('id');
  debugger;
  var my_data = {id: bbqId};
  var request = $.post(this.url, my_data);
  request.done(function(data) {
    console.log("Saved");
  });
  var reload = new ShowAll();
  reload.showAll();
};
