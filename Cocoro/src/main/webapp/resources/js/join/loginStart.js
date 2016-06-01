$(function(){
	
	 

	
			"use strict";
			var options = {};
			
			options.ui = {
				container : "#pwd-container",
				showVerdictsInsideProgressBar : true,
				viewports : {
					progress : ".pwstrength_viewport_progress"
				}
			};
		
			options.common = {
				debug : true,
				onLoad : function() {
					$("#messages").text("Start typing password");
				}
			};
			
			$("#password").pwstrength(options);
			alert("ih");
		});
		
		$(function(){
			
			$('#birth').datepicker({
		        'format': 'yyyy-mm-dd',
		        'autoclose': true
		    });



			$('[role="presentation"]').click(function(){

				var domain = $(this).find("a").text();

				$("#domain").val(domain);

			});
			
			$("#confirmsignup").click(function() {

				//submitFunc();
				return submitFunc();

			});
			$("#useridTmp").keyup(function() {

				checkId();
			});
			$("#reenterpassword").keyup(function() {

				checkPWD();
				checkEmpty();
			});

			$("#password").keyup(function() {

				checkEmpty();
			});
			
			});
		
		 function initialize() {
			 //alert("hi");
		        var input = document.getElementById('searchTextField');
		        var autocomplete = new google.maps.places.Autocomplete(input);
		        google.maps.event.addListener(autocomplete, 'place_changed', function () {
		            var place = autocomplete.getPlace();
		          
		            /*document.getElementById('lat').value = place.geometry.location.lat();
		            document.getElementById('lng').value = place.geometry.location.lng();
		            //alert("This function is working!");
		            //alert(place.name);
		           // alert(place.address_components[0].long_name);
*/
		        });
		    }
		    google.maps.event.addDomListener(window, 'load', initialize); 