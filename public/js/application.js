$(document).ready(function() {
    $(".navbar").on("click", "#register-link", function(event) {
    event.preventDefault();
    var $link = $(this).attr('href');
    var $this =$(this);

    var request = $.ajax({
      method: "GET",
      url: $link
    });
    request.done(function(response){
      console.log(response);
      $('form').remove;
      $('body').prepend(response);

    })

    })
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
