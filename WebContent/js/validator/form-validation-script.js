var Script = function () {

    $.validator.setDefaults({
        submitHandler: function() { 
        	alert("hfusfhsfuhshfs");
       $('#test').modal('show');
		 }
    });

    $().ready(function() {
        // validate the comment form when it is submitted
       

        // validate signup form on keyup and submit
        $("#demo").validate({
            rules: {
                coursename: {
                    required: true,
                   
                },
                years: {
                    required: true,
                   
                },
                sems: {
                    required: true,
                    
                },
                description: {
                    required: true,
                   
                },
                
                
                
                
            },
            messages: {                
                coursename: {
                    required: "Please enter a coursename.",
                   
                },
                years: {
                    required: "Please enter a years.",
                    
                },
                sems: {
                    required: "Please enter a semester.",
                   
                },
                description: {
                    required: "Please provide a description.",
                    
                },
                
                
            }
        });
       

        
    });


}();