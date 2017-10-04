$(document).ready( function() {
   $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });

   var current = 1,current_step,next_step,steps;
  steps = $("fieldset").length;
  $(".next").click(function(){
    current_step = $(this).parent();
    next_step = $(this).parent().next();
    next_step.show();
    current_step.hide();
    setProgressBar(++current);
  });
  $(".previous").click(function(){
    current_step = $(this).parent();
    next_step = $(this).parent().prev();
    next_step.show();
    current_step.hide();
    setProgressBar(--current);
  });
  setProgressBar(current);
  // Change progress bar action
  function setProgressBar(curStep){
    var percent = parseFloat(100 / steps) * curStep;
    percent = percent.toFixed();
    $(".progress-bar")
      .css("width",percent+"%")
  }
});


// $(function() {
//   $("#register-form").validate({
//         rules: {
//           first_name: {required: true},
//           last_name: {required: true},
//           password: {
//             required: true,
//             minlength: 8
//           },
//           password_confirm:{
//             required: true,
//             minlength: 8,
//             equalTo: "#password"
//           },
//           email: {
//             required: true,
//             email:true
//             },
//           email_confirm:{
//             required: true,
//             email:true,
//             equalTo: "#email"
//
//           }
//         },
//         //For custom messages
//         messages: {
//             first_name: {
//               required: "First name required"
//             },
//             last_name: {
//               required: "Last name required"
//             },
//             password:{
//                 required: "Enter a password",
//                 minlength: "Enter at least 8 characters"
//             },
//             password_confirm:{
//               required: "Enter a password",
//               minlength: "Enter at least 8 characters",
//               equalTo: "Passwords don't match"
//             },
//             email:{
//               required: "Please enter your email address",
//               email: "Please enter a valid email."
//             },
//             email_confirm:{
//               required: "Please re-enter your email address",
//               email: "Please enter a valid email address",
//               equalTo: "Emails don't match"
//             }
//         },
//       errorElement : 'div',
//         errorPlacement: function(error, element) {
//           var placement = $(element).data('error');
//           if (placement) {
//             $(placement).append(error)
//           } else {
//             error.insertAfter(element);
//           }
//         }
//
//      });
// });



// validations by: https://jqueryvalidation.org/documentation/
