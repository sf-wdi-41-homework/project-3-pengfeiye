$(document).on('turbolinks:load',function(){
  $('#msgInput').on('keypress', function(e){
    if(e.keyCode === 13){
      e.preventDefault()
      $('#msgForm').submit()
      $('#msgInput').val('')
      }
    });



    $(".signup_link").click(function(e) {
      e.preventDefault()
    	$(".signin_form").hide();
    	$(".signup_form").show();
    });


  }
)
