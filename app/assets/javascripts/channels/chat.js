

$(function() {
  const app = App.cable.subscriptions.create({channel: 'ChatChannel', room_id: $('#room').data('room') }, {
    connected: function(data) {
    },
    disconnected: function(data) {
    },
    received(data) {
      if ($('#room').data('user') == data['user_id']) {
        $('.message').append('<div class="col-6 offset-6">' 
          + '<p style="text-align: right">' + data['user_name'] + '</p>' 
          + '<p class="float-right bg-info">' + data['message'] + '</p>'
          + '</div>');
      } 
      else {
        $('.message').append('<div class="col-6 bg-warning">' 
          + '<p style="text-align: left">' + '新規メッセージです' + '</p>' 
          + '<p class="float-left">' + data['user_name'] + '</p>' 
          + '<p class="float-left bg-warning">' + data['message'] + '</p>'
          + '</div>');
      }
    }
  })
  $(document).on('click', '#chat_post', function(e) {

      app.perform("create", {data: $('.post').val(), user_id: $('#room').data('user')});
      $('.post').val('');

  })
})