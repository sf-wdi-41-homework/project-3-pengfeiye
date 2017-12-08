$(document).on('turbolinks:load',function(){
  updateScroll()

  $('#msgInput').on('keypress', function(e){
    if(e.keyCode === 13){
      e.preventDefault()
      $('#msgForm').submit()
      $('#msgInput').val('')
      updateScroll()
      }
    });

  $('.createChat').on('submit', function(e){
    console.log("submit")
    App.chatbox.connected
  })

    function updateScroll(){
      $(".msg").animate({ scrollTop: $(this).height() }, "fast");
      return false;
    }

    $(".signup_link").click(function(e) {
      e.preventDefault()
    	$(".signin_form").hide();
    	$(".signup_form").show();
    });



  }
)
