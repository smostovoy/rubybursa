socket = new Pusher('c271d10e2915f1884cf7')
channel = socket.subscribe('main')
channel.bind 'article_created', (data) ->
  alert('pusher')
  $('#pusher-box').text(data)


$(document).on 'click', '#pusher-box', ->
  alert('clicked')
  $('#pusher-box').text('')
