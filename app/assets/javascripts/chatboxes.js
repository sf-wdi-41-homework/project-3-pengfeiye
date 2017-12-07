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

    function updateScroll(){
      $(".msg").animate({ scrollTop: $(this).height() }, "slow");
      return false;
    }

    $(".signup_link").click(function(e) {
      e.preventDefault()
    	$(".signin_form").hide();
    	$(".signup_form").show();
    });


  }
)
