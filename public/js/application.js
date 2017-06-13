//brings up registration form to the index page

$(document).ready(function() {
  $("#register-link").on("click", function(event) {
    event.preventDefault();
    var $link = $(this).attr('href');

    var request = $.ajax({
        method: "GET",
        url: $link
    });

    request.done(function(response){
        console.log(response);
        $('form').hide();
        $('body').prepend(response);
    })

  })

 //login link ajax

    $("#login-link").on("click", function(event) {
      event.preventDefault();
      var $link = $(this).attr('href');

      var request = $.ajax({
          method: "GET",
          url: $link
      });

      request.done(function(response){
      // console.log(response);
          $('form').hide();
          $('body').prepend(response);
      })
    })

  //pulling up new blog post form AJAX

  $('#click-form').on('click', function(event){
      event.preventDefault();
      // console.log('button');
      var $link = $(this).attr('href')

      var request = $.ajax({
            method: "GET",
            url: $link
      });

      request.done(function(response){
      // console.log(response);
            $('#click-form').closest('div').prepend(response);
            $('#click-form').hide();
      });
  })

  //submitting new blog post, prepends new post to the top of the blog

   $('#blog-parent').on('submit', "#blog-form", function(event){
      event.preventDefault();
     // console.log($(this));
          var $form = $(this);
          var $action = $form.attr('action');
          var $method = $form.attr('method');
          var formData = $form.serialize();

    var request = $.ajax({
          method: $method,
          action: $action,
          data: formData
    });
    // console.log(formData);

    request.done(function(response){
    // console.log(response);
          $form.hide();
          $('.entries-list').prepend(response);
          $form[0].reset();
          $form.fadeIn([650]);
    });
  })

});
