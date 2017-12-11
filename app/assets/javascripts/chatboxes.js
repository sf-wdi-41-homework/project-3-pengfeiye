$(document).on('turbolinks:load',function(){

  setTimeout(function(){
           App.cable.disconnect();
       }, 250);
   setTimeout(function(){
       App.cable.connect();
   }, 500);
  updateScroll()
  console.log()

  $('#msgInput').on('keypress', function(e){
    if(e.keyCode === 13){
      e.preventDefault()
      $('#msgForm').submit()
      $('#msgInput').val('')
      updateScroll()
      }
    });


  function updateScroll(){
    $(".msg").animate({ scrollTop: $(".msg")[0].scrollHeight }, "fast");
  }

  $(".signup_link").click(function(e) {
    e.preventDefault()
  	$(".signin_form").hide();
  	$(".signup_form").show();
  });

  }
)
