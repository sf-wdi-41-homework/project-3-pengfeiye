App.chatbox = App.cable.subscriptions.create "ChatboxChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_chat = $("[chatbox-id='#{data.chatbox_id}']")
    if active_chat.length > 0
      $("[chatbox-id='#{data.chatbox_id}']").append(data.message)
    else
      $("[data-chat-id='#{data.chatbox_id}']").css("font-weight", "bold")
    # Called when there's incoming data on the websocket for this channel
