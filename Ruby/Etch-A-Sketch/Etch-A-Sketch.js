$(document).ready(function(){
  $('.changeGrid').on('click', function() {
    $('#grid').empty();
    var columns = document.getElementsByName("size")[0].value;
    var rows    = document.getElementsByName("size")[1].value;
    $('#grid').width(22*columns); //22 = box width
    $('#grid').height(22*rows);
    
    for (var i = 0;i < columns*rows; i++) {
    $('#grid').append("<div id='box'></div>");
    }
  })
  
$("#fade").on("click",function() {
  $(document).on("mouseenter", "#box", function(){
    var fadeTo = $(this).css("opacity");
    $(this).css("opacity", ( fadeTo > 0.1 ) ? ( fadeTo - 0.1 ) : fadeTo ); 
    //shorthand if statement (result = testCondition ? value1 : value2)
    //ternary operator 
  });
});
  
  $(document).on("mouseenter", "#box", function(){
      $(this).css('background-color',$('#colors').val());
     });
});
