// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery-ui
//= require jquery.validate
//= require_tree .

$(document).ready(function() {
    $('#calender').datepicker({
        dateFormat: 'dd/mm/yy',
        minDate: +0
});
    $(".new_product").validate({
        rules: {
            "product[name]":{
                required: true,
                maxlength:50,
                minlength:1
            },
            "product[price]": {
                digits: true,
                require:true

            },
            "product[publish_date]":{
                required:true,
                digits: true

            }

        }
    });


    $(document).ready(function(){
        $(".sign_up").validate({
            rules: {

                "user[email]": {
                    required: true,
                    email: true
                },
                "user[password]": {
                    required:true,
                    minlength: 8
                },
                "user[password_confirmation]": {
                    equalTo: "#user_password"
                }
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
    });
})
