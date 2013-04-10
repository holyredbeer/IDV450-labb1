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
//= require bootstrap
//= require bootstrap-datepicker
//= require_tree .
//= require jquery.validate

$(document).ready(function() {

	// Validation
	$("#new_project").validate({
		rules:{
			user_name:"required",
			user_email:{
				required:true,email: true
			},
		pwd:{
			required: true,
			minlength: 6
		},
		cpwd:{
			required: true, equalTo: "#pwd"
		},
		gender: "required"
	},

	messages:{
	user_name:"Enter your first and last name",
	user_email:{
	required:"Enter your email address",
	email:"Enter valid email address"},
	pwd:{
	required:"Enter your password",
	minlength:"Password must be minimum 6 characters"},
	cpwd:{
	required:"Enter confirm password",
	equalTo:"Password and Confirm Password must match"},
	gender:"Select Gender"
	},

	errorClass: "help-inline",
	errorElement: "span",
	highlight:function(element, errorClass, validClass)
	{
	$(element).parents('.control-group').addClass('error');
	},
	unhighlight: function(element, errorClass, validClass)
	{
	$(element).parents('.control-group').removeClass('error');
	$(element).parents('.control-group').addClass('success');
	}
	});
});