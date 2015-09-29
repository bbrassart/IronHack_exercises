var AddItem = function() {
  this.setInitialListeners();
  this.url = 'api/v1/barbecues/item/';
}

AddItem.prototype.setInitialListeners = function(event) {
  var that = this;
  $('#addNewItem').on('submit', '#itemForm', function(event) {
    event.preventDefault();
    that.addItem();
  });
}
AddItem.prototype.addItem = function() {
  var user_item = $('input[name=item]').val();
  var bbqId = $(event.target).data("id");
  var data = {value: user_item, bbq: bbqId};
  var request = $.post(this.url, data);
  var reload = new ShowBarbecue();
  reload.showBarbecue();
};
