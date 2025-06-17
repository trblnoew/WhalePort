//Basic Example
$("#example-basic").steps({
  headerTag: "h3",
  bodyTag: "section",
  transitionEffect: "slideLeft",
  autoFocus: true,
});

// Basic Example with form
var form = $("#example-form");
form.validate({
  errorPlacement: function errorPlacement(error, element) {
    element.before(error);
  },
  rules: {
    confirm: {
      equalTo: "#password",
    },
  },
});
form.children("div").steps({
  headerTag: "h3",
  bodyTag: "section",
  transitionEffect: "slideLeft",
  onStepChanging: function (event, currentIndex, newIndex) {
    form.validate().settings.ignore = ":disabled,:hidden";
    return form.valid();
  },
  onFinishing: function (event, currentIndex) {
    form.validate().settings.ignore = ":disabled";
    return form.valid();
  },
  onFinished: function (event, currentIndex) {
    alert("Submitted!");
  },
});

// Advance Example

var advanced_form = $("#example-advanced-form").show();

advanced_form
  .steps({
    headerTag: "h3",
    bodyTag: "fieldset",
    transitionEffect: "slideLeft",
    onStepChanging: function (event, currentIndex, newIndex) {
      // Allways allow previous action even if the current form is not valid!
      if (currentIndex > newIndex) {
        return true;
      }
      // Forbid next action on "Warning" step if the user is to young
      if (newIndex === 3 && Number($("#age-2").val()) < 18) {
        return false;
      }
      // Needed in some cases if the user went back (clean up)
      if (currentIndex < newIndex) {
        // To remove error styles
        advanced_form.find(".body:eq(" + newIndex + ") label.error").remove();
        advanced_form.find(".body:eq(" + newIndex + ") .error").removeClass("error");
      }
      advanced_form.validate().settings.ignore = ":disabled,:hidden";
      return advanced_form.valid();
    },
    onStepChanged: function (event, currentIndex, priorIndex) {
      // Used to skip the "Warning" step if the user is old enough.
      if (currentIndex === 2 && Number($("#age-2").val()) >= 18) {
        advanced_form.steps("next");
      }
      // Used to skip the "Warning" step if the user is old enough and wants to the previous step.
      if (currentIndex === 2 && priorIndex === 3) {
        advanced_form.steps("previous");
      }
    },
    onFinishing: function (event, currentIndex) {
      advanced_form.validate().settings.ignore = ":disabled";
      return advanced_form.valid();
    },
    onFinished: function (event, currentIndex) {
      alert("Submitted!");
    },
  })
  .validate({
    errorPlacement: function errorPlacement(error, element) {
      element.before(error);
    },
    rules: {
      confirm: {
        equalTo: "#password-2",
      },
    },
  });

// Dynamic Manipulation
$("#example-manipulation").steps({
  headerTag: "h3",
  bodyTag: "section",
  enableAllSteps: true,
  enablePagination: false,
});

//Vertical Steps

$("#example-vertical").steps({
  headerTag: "h3",
  bodyTag: "section",
  transitionEffect: "slideLeft",
  stepsOrientation: "vertical",
});

//Custom design form example
//finish : submit > 마이페이지 이동으로 수정
$(".tab-wizard").steps({
  headerTag: "h6",
  bodyTag: "section",
  transitionEffect: "fade",
  titleTemplate: '<span class="step">#index#</span> #title#',
  labels: {
    finish: "마이페이지 이동",
  },
  onFinished: function (event, currentIndex) {
    // Redirect to customerMain
    window.location.href = "/user/cumtomerMain"; 
  },
});

// 0 : 예약가능조회
// 1 : 예약신청
// 2 : 예약확인
let tabWizardCnt = 0;	// 초기 페이지 예약가능조회
$(".tab-wizard").on("click", "a[href='#next']", function(){
	tabWizardCnt++;	// 해당 값이 2
	if(tabWizardCnt == 2){	// 카카오페이 결제 페이지로 이동할게
		alert("향후 카카오페이로 연동될거야!");
	}
	if(tabWizardCnt >= 2){
		tabWizardCnt = 2;
	}
});
$(".tab-wizard").on("click", "a[href='#previous']", function(){
	tabWizardCnt--;	
	if(tabWizardCnt <= 0){
		tabWizardCnt = 0;
	}
});

var form = $(".validation-wizard").show();


$(".validation-wizard").steps({
  headerTag: "h6",
  bodyTag: "section",
  transitionEffect: "fade",
  titleTemplate: '<span class="step">#index#</span> #title#',
  labels: {
    finish: "submit",
  },
  onStepChanging: function (event, currentIndex, newIndex) {
    return (
      currentIndex > newIndex ||
      (!(3 === newIndex && Number($("#age-2").val()) < 18) &&
        (currentIndex < newIndex &&
          (form.find(".body:eq(" + newIndex + ") label.error").remove(),
          form.find(".body:eq(" + newIndex + ") .error").removeClass("error")),
        (form.validate().settings.ignore = ":disabled,:hidden"),
        form.valid()))
    );
  },
  onFinishing: function (event, currentIndex) {
    return (form.validate().settings.ignore = ":disabled"), form.valid();
  },
  

  onFinished: function (event, currentIndex) {
    swal(
      "Form Submitted!",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed lorem erat eleifend ex semper, lobortis purus sed."
    );
  },
}),
  $(".validation-wizard").validate({
    ignore: "input[type=hidden]",
    errorClass: "text-danger",
    successClass: "text-success",
    highlight: function (element, errorClass) {
      $(element).removeClass(errorClass);
    },
    unhighlight: function (element, errorClass) {
      $(element).removeClass(errorClass);
    },
    errorPlacement: function (error, element) {
      error.insertAfter(element);
    },
    rules: {
      email: {
        email: !0,
      },
    },
  });