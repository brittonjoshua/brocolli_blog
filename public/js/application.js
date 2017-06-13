$(document).ready(function() {
  $('#click-form').on('click', function(event){
    event.preventDefault();
    // console.log('button');
    var $link = $(this).attr('href')

    var request = $.ajax({
      method: "GET",
      url: $link
    });
    request.done(function(response){
      console.log(response);
      $('#click-form').closest('div').prepend(response);
      $('#click-form').hide();
    });



  })
});
