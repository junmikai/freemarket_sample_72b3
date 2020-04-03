$(function(){
  $('.commentBtn').on('click', function(){
    $(".productcheck").show()
 });
})

$(function(){
  $('.productcheck').on('mouseleave', function(){
    $(this).hide()
 });
})