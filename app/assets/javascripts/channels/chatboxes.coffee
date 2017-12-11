App.chatbox = App.cable.subscriptions.create "ChatboxChannel",
    connected: ->
      # Called when the subscription is ready for use on the server


    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      updateScroll= ->
        $(".msg").animate({ scrollTop: $(".msg")[0].scrollHeight }, "fast");
      do updateScroll
      active_chat = $("[chatbox-id='#{data.chatbox_id}']")
      if active_chat.length > 0
        if $(".msg").attr("data-user-id") != data.current_user.toString()
          $("[chatbox-id='#{data.chatbox_id}']").append(data.message)
          $('#msgInput').val('')
        else
          $("[chatbox-id='#{data.chatbox_id}']").append('<div class="text-right">'+data.message.replace("alert-info", "alert-success")+'</div>')
          $('#msgInput').val('')


      else
        # $ -> $('body').append('<audio controls id="notification" autoplay hidden><source src="/job-done.mp3" type="audio/mpeg"></audio>');
        $("[data-chat-id='#{data.chatbox_id}']").css("font-weight", "bold");
        $("[data-chat-id='#{data.chatbox_id}']").parents("li").children("a").css({"color":"lime", "font-weight": "bold"});



      # Called when there's incoming data on the websocket for this channel
