
     

        // validate signup form on keyup and submit
        $("#demo").validate({
            rules: {
                firstname: {
                    required: true,
                   
                },
                lastname: {
                    required: true,
                }
                
                
                
                
            },
            messages: {                
                firstname: {
                    required: "Please enter a coursename.",
                   
                },
                lastname: {
                    required: "Please enter a years.",
                    
                },
                
                
                
            },
            
            submitHandler: function (form) {
            	
            	
        		$('#tr').click(function () {
        			 $("#test").modal('show');
                    form.submit();
               });
            
            }
            
        
        });
       

        
   
