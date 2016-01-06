function loadReceiptDetails(studentId){
	$.get('ReceiptServlet', {
        studentId : studentId
       }, function(response) {
       	var tableBody = $('#bodyContent');
    	    tableBody.find('tr').remove();
    	    var totalpendingfees=0;
				  $.each(response, function(index, receiptObject) {
					  totalpendingfees+=receiptObject.pendingFees;
	  				 $("#bodyContent").append('<tr>'
	  				 +'<td>'+receiptObject.receiptId+'</td>'
	  				 +'<td>'+receiptObject.studentId+'</td>'
	  			     +'<td>'+receiptObject.semester+'</td>'
	  			     +'<td>'+receiptObject.totalFees+'</td>'
	  			     +'<td>'+receiptObject.pendingFees+'</td>'
	  			   +'<td id="pendingfees">'
	  			     +'<td>'
                    +'<div class="form-group">'
                      +'<div class="col-sm-6 col-md-6"" >'
                       
        	        
            		      +'<a href="#"  data-href="#" data-id=" " class="btn btn-warning btn-sm" data-toggle="modal" data-target="#confirm-edit">'
                           +'<span class="glyphicon glyphicon-eye-open"></span> </a>'
                    +'</div>'
                +'</td>')
	  				   //need to change based on object
	  				   
             });
				  $("#pendingfees").text(totalpendingfees);
				document.getElementById('FormDiv').style.display="block";		  
   });
}