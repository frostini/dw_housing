// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
// var appClient = {};
 // appClient = (function( $ ) {
	// 'use strict';
	// var initNoUISlider = {};
	// appClient.initNoUISlider = function() {
	$( document ).ready(function() {
var paymentSlider = document.getElementById('monthly_payment');
noUiSlider.create(paymentSlider, {
	connect: true,
	start: [ 500, 4000 ],
	range: {
		'min': [     0 ],
		'10%': [   500,  500 ],
		'50%': [  4000, 1000 ],
		'max': [ 10000 ]
	}
});
var snapValues = [
	document.getElementById('slider-snap-value-lower'),
	document.getElementById('slider-snap-value-upper')
];
paymentSlider.noUiSlider.on('update', function( values, handle ) {
	snapValues[handle].innerHTML = values[handle];
});




var proximitySlider = document.getElementById('nonlinear');
noUiSlider.create(proximitySlider, {
	connect: true,
	start: [ 500, 4000 ],
	range: {
		'min': [     0 ],
		'10%': [   500,  500 ],
		'50%': [  4000, 1000 ],
		'max': [ 10000 ]
	}
});
var proximitySnapValues = [
	document.getElementById('slider-snap-value-lower_1'),
	document.getElementById('slider-snap-value-upper_2')
];
proximitySlider.noUiSlider.on('update', function( values, handle ) {
	proximitySnapValues[handle].innerHTML = values[handle];
});

	;$( "input#distance_slider" ).on( "click",  function( event ) {
	  event.stopImmediatePropagation();
	  var inputValue = '',
	  		distanceInMiles = '';
	  var connectSlider = document.getElementById('nonlinear');
	  console.log('hit the input slider');
			  inputValue = connectSlider.noUiSlider.get();
			  console.log(inputValue);
	  var lowerDistanceInMiles = inputValue[0];
	  var higherDistanceInMiles = inputValue[1];
		$('#proximity_lower').val(lowerDistanceInMiles);
		$('#proximity_higher').val(higherDistanceInMiles);
	  $('#search_form').submit();
	});


});

	// },
	// appClient.ready = function() {
		// appClient.initNoUISlider();
	// };
	// return {
		// ready: appClient.ready()
	// }
// })( jQuery );

// jQuery( appClient.ready );