$(document).ready(function(){
  setTimeout(function(){
    $('.mensajeAlert').fadeOut("slow",function(){
      $(this).remove();
    })
  }, 4500);
});