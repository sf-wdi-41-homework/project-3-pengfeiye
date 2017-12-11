$(document).on('turbolinks:load',function(){

  setTimeout(function(){
           App.cable.disconnect();
       }, 250);
   setTimeout(function(){
       App.cable.connect();
   }, 500);


  $(".signup_link").click(function(e) {
    e.preventDefault()
  	$(".signin_form").hide();
  	$(".signup_form").show();
  });

  }
)
