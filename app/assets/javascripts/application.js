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
	connect: "lower",
	start: [ 2000 ],
	step: 10,
	range: {
		'min': [  0 ],
		'max': [ 10000 ]
	}
});

var rangeSliderValueElement = document.getElementById('slider-snap-value-lower');

paymentSlider.noUiSlider.on('update', function( values, handle ) {
	rangeSliderValueElement.innerHTML = values[handle];
});





var proximitySlider = document.getElementById('nonlinear');


noUiSlider.create(proximitySlider, {
	connect: "lower",
	start: [ 50 ],
	step: 5,
	range: {
		'min': [  5 ],
		'max': [ 500 ]
	}
});

var rangeSliderValueElement_1 = document.getElementById('slider-snap-value-lower_1');

// var proximitySnapValues = [
// 	document.getElementById('slider-snap-value-lower_1'),
// 	document.getElementById('slider-snap-value-upper_2')
// ];
// proximitySlider.noUiSlider.on('update', function( values, handle ) {
// 	proximitySnapValues[handle].innerHTML = values[handle];
// });

proximitySlider.noUiSlider.on('update', function( values, handle ) {
	rangeSliderValueElement_1.innerHTML = values[handle];
});

	;$( "input#dwelling_search_form" ).on( "click",  function( event ) {
	  event.stopImmediatePropagation();
	  var paymentValue = '',
			  proximityValue = '',
	  		distanceInMiles = '';
	  var paymentSlider = document.getElementById('monthly_payment');
	  var proximitySlider = document.getElementById('nonlinear');
	  console.log('hit the input slider');
			  paymentValue = paymentSlider.noUiSlider.get();
			  proximityValue = proximitySlider.noUiSlider.get();
			  // console.log(inputValue);
	  // var lowerPriceInDollars = secondValues[0];
	  // var higherPriceInDollars = secondValues[1];
	  	  // var lowerDistanceInMiles = inputValue[0];
	  // var higherDistanceInMiles = inputValue[1];
		// parseInt("10.00")
paymentValue = parseInt(paymentValue);
proximityValue = parseInt(proximityValue);

		$('#mo_rent_price').val(paymentValue);
		// $('#proximity_higher').val(higherDistanceInMiles);

		$('#search_proximity').val(proximityValue);
		// $('#price_higher').val(higherPriceInDollars);

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