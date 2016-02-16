<%@page import="in.jdsoft.studentmanagement.model.Courses"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.jdsoft.studentmanagement.controller.CourseController"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="error.jsp" %>
<%
		if(session.getAttribute("authenticated")!="true"){
		response.sendRedirect("user_login.jsp");
		  }
		else{%>
  		
 <!DOCTYPE html>
<html lang="en">
<head>
   <link href="css/bootstrap.min.css" rel="stylesheet">
   <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
   <link href="css/animate.min.css" rel="stylesheet">
    <!-- Custom styling plus plugins -->
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/icheck/flat/green.css" rel="stylesheet">
    <link href="css/shadow.css" rel="stylesheet">
    <!-- editor -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
    <link href="css/editor/external/google-code-prettify/prettify.css" rel="stylesheet">
    <link href="css/editor/index.css" rel="stylesheet">
    <!-- select2 -->
    <link href="css/select/select2.min.css" rel="stylesheet">
    <!-- switchery -->
    <link rel="stylesheet" href="css/switchery/switchery.min.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="//oss.maxcdn.com/bootbox/4.2.0/bootbox.min.js"></script>
    <script src="//code.jquery.com/jquery-1.8.2.min.js"></script> 
    <script type = "text/javascript"  src = "http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
     <script src="js/mycustom/autosearch.js" ></script>
     <script src="js/mycustom/crud.js" ></script>
     <script type = "text/javascript">
         $(document).ready(function() {
        	$("#getinvoices").click(function(event){
               var id = $("#studentId").val();
               if(id){
            	   $("#invoice-content").load('allInvoices.jsp', {"studentId":id} );
            	}
               else{
            	   $('#invde').modal('show');
               }
                  
            });
        	
        	
        	
        	
        	
        	
         });
      </script>
      
      
      
      
      <script type="text/javascript">
      
      
      function isNumber(evt) {
  	    evt = (evt) ? evt : window.event;
  	    var charCode = (evt.which) ? evt.which : evt.keyCode;
  	    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
  	        return false;
  	    }
  	    return true;
  	}
  	
      
      
      
      </script>
      <title>Student Results</title>
</head>
<body class="nav-md">
  <div class="container body">
    <div class="main_container">
    <%@ include file="master_menu.jsp" %>
   		<%@ include file="master_header.jsp" %>
      <div class="right_col" role="main" >
        
                <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Result Details</h2>
   
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                  <ul class="list-unstyled timeline">
                                    <li>
                                        <div class="block">
                                            <div class="tags">
                                                <a href="" class="tag">
                                                    <span>Level One</span>
                                                </a>
                                            </div>
                                            <div class="block_content">
                                            <h2 class="title">
                                              Semester 1
                                    </h2>
                                    <br>
                                    
                                             <div class="x_panel">
                                            <div class="table-responsive">
                                                 <table class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Serial No</th>
                                                <th>Exam Code</th>
                                                <th>Subject Code</th>
                                                 <th>Attedance Marks</th>
                                                  <th>Grade</th>
                                                   <th>Result</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td scope="row">1</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                <td>Pass</td>
                                                
                                            </tr>
                                            <tr>
                                                <td scope="row">2</td>
                                                <td>Jacob</td>
                                                <td>Thornton</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                 <td>Pass</td>
                                              
                                            </tr>
                                            <tr>
                                                <td scope="row">3</td>
                                                <td>Larry</td>
                                                <td>the Bird</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                 <td>Pass</td>
                                              
                                            </tr>
                                        </tbody>
                                    </table>
                                    </div>
                                    </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="block">
                                            <div class="tags">
                                                <a href="" class="tag">
                                                    <span>Level Two</span>
                                                </a>
                                            </div>
                                            <div class="block_content">
                                               <h2 class="title">
                                              Semester 2
                                    </h2>
                                    <br>
                                    
                                             <div class="x_panel">
                                            <div class="table-responsive">
                                                 <table class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Serial No</th>
                                                <th>Exam Code</th>
                                                <th>Subject Code</th>
                                                 <th>Attedance Marks</th>
                                                  <th>Grade</th>
                                                  <th>Result</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td scope="row">1</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                 <td>Pass</td>
                                                
                                            </tr>
                                            <tr>
                                                <td scope="row">2</td>
                                                <td>Jacob</td>
                                                <td>Thornton</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                 <td>Pass</td>
                                              
                                            </tr>
                                            <tr>
                                                <td scope="row">3</td>
                                                <td>Larry</td>
                                                <td>the Bird</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                 <td>Pass</td>
                                              
                                            </tr>
                                        </tbody>
                                    </table>
                                    </div>
                                    </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="block">
                                            <div class="tags">
                                                <a href="" class="tag">
                                                    <span>Level Three</span>
                                                </a>
                                            </div>
                                            <div class="block_content">
                                                <h2 class="title">
                                              Semester 3
                                    </h2>
                                    <br>
                                    
                                             <div class="x_panel">
                                            <div class="table-responsive">
                                                 <table class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Serial No</th>
                                                <th>Exam Code</th>
                                                <th>Subject Code</th>
                                                 <th>Attedance Marks</th>
                                                  <th>Grade</th>
                                                  <th>Result</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td scope="row">1</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                 <td>Pass</td>
                                                
                                            </tr>
                                            <tr>
                                                <td scope="row">2</td>
                                                <td>Jacob</td>
                                                <td>Thornton</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                 <td>Pass</td>
                                              
                                            </tr>
                                            <tr>
                                                <td scope="row">3</td>
                                                <td>Larry</td>
                                                <td>the Bird</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                 <td>Pass</td>
                                              
                                            </tr>
                                        </tbody>
                                    </table>
                                    </div>
                                    </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>


                            </div>
                        </div>
                    </div>
                  
                
           
        </div>
    </div>
</div>

<div id="custom_notifications" class="custom-notifications dsp_none">
     <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
     </ul>
     <div class="clearfix"></div>
     <div id="notif-group" class="tabbed_notifications"></div>
</div>

  <script src="js/bootstrap.min.js"></script>
  
  <!-- bootstrap progress js -->
    <script src="js/progressbar/bootstrap-progressbar.min.js"></script>
    <script src="js/nicescroll/jquery.nicescroll.min.js"></script>
  
  <!-- custom js -->
    <script src="js/custom.js"></script>
     <!-- formHide jquery -->
  		<script type="text/javascript" src="js/formHide.js"></script>
 	<!-- /formHide jquery -->
  <!-- /custom js -->
     
  <script>
        NProgress.done();
   </script>
   <!-- /datepicker -->
  <!-- /footer content -->
  
 
  
 
</body>
</html>
 <%}%>
 