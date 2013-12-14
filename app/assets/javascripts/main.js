$(document).ready(function() {
    $("#commit").click(function(){
          if($("#new_comment").valid())
          {
            // $("#load_img").show();
            $('#activity_pane').showLoading();
          }

        });
    $("#new_comment").validate({
      errorClass: "inputError",
      rules:{
        "comment[body]":{
          required: true,
          minlength: 5
        },
      }
    });
    $("#new_user").validate({
      errorClass: "inputError",
      rules:{
        "user[email]":{
          required: true,
          email: true
        },
        "user[password]":{
          required: true,
          minlength: 6
        },
        "user[password]":{
          required: true,
          minlength: 6
        },
        "user[password_confirmation]":{
          required: true,
          minlength: 6,
          equalTo: "#user_password"
        }
      }
    });
    $(".post-validate").validate({
      errorClass: "inputError",
      rules:{
        "post[title]":{
          required: true,
          minlength: 5
        },
        'post[text]':{
          required: true,
          minlength: 5
        }
      },
    });
    $("#post_title").focus();
    $("#comment_body").focus();

})