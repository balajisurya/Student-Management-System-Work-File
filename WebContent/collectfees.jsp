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
    <title>Collect Fees</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="//oss.maxcdn.com/bootbox/4.2.0/bootbox.min.js"></script>
    <script src="//code.jquery.com/jquery-1.8.2.min.js"></script> 
    <script type = "text/javascript"  src = "http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
     <script src="js/mycustom/autosearch.js" ></script>
     <script src="js/mycustom/crud.js" ></script>
     <script src="js/mycustom/ajax/collectfees.js" ></script>
     <script type = "text/javascript">
         $(document).ready(function() {
        	 $("#getFeesDetails1").click(function(event){
        			var id = $("#studentId").val();
        	       if(id){
        	    	   var valid=true;
        	    	   if(valid){
        	    		   loadReceiptDetails(id);   
        	    	   }
        	    	   else{
        	    		   $('#test').modal('show');
        	    	   }
        	    	}
        	       else{
        	    	$('#test').modal('show');
        	    	}
        	          
        	    });
         });
      </script>
      <script type = "text/javascript">
         $(document).ready(function() {
        	 $("#getFeesDetails").click(function(event){
        			

        		   	$('#test').modal('show');
        	   
        	          
        	    });
         });
      </script>
</head>
<body class="nav-md">
  <div class="container body">
    <div class="main_container">
    <%@ include file="master_menu.jsp" %>
   		<%@ include file="master_header.jsp" %>
      <div class="right_col" role="main" >
        <div id="ListDiv" style="display:block;"> <br>
          <br /><div class="title_left">
                  <h3>Collect Fees</h3>
             
               </div>
 				<div class="x_title">
 				  <div class="clearfix">
 				  </div>
 				</div> 
 				  <div class="x_title">
 				  <div class="clearfix">
 				     <div class="form-group">
                            
                               <div class="col-md-3 col-sm-3 col-xs-3">
                                     <input type="text" id="studentId" name="studentId" required="required" class="form-control col-md-7 col-xs-12" placeholder="Enter Student Id">
                               </div>
                              <input type="button"  class="btn btn-primary" id="getFeesDetails" name="getFeesDetails" value="Fees Details">
                               
                     </div>
 				  </div>
 				</div>
 </div><!-- end of LisDiv div -->
                                
	<div id="FormDiv" style="display: none;"> 
       <div class="clearfix"></div><!-- end of clearfix div -->
           <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                 <div id="fees-details" class="x_panel" style="height:auto">
                 	<div  id="printList" class="table-responsive">
    <table id="table" class="table table-bordered table-striped">
        <thead >
            <tr>
                <th>Receipt Id</th>
                <th>Student Id</th>
                <th>Semester</th>
                <th>Total Fees</th>
                <th>Pending Fees</th>
                <!--<th>Amount</th> -->
            </tr>
        </thead>
        <tbody id="bodyContent">
            <!-- Content Based on User input from ajax method -->
            <tr></tr>    
        </tbody>
    </table>
</div>
                                <div class="col-md-4">
                                                <h4><label>Total Pending Fees:</label></h4>
                                                <div class="table-responsive">
                                                    <table class="table table-striped">
                                                        <tbody>
                                                            <tr>
                                                                <th style="width:50%">Amount:</th>
                                                                <td id="pendingfees"></td>
                                                            </tr>
                                                            
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
<br></br>

                <div class="form-group col-md-8 col-sm-8 col-xs-12">
                     <h4> <label id="payingfees" style="text-align: right;" class="control-label col-md-6 col-sm-6 col-xs-12">Enter Amount to be Paid:
                      </label></h4>
                      <div class="col-md-4 col-sm-6 col-xs-12">
                          <input type="text" id="payingfees" placeholder="Enter the amount" name="payingfees" required="required" class="form-control col-md-3 col-xs-12 col-sm-6">
                      </div>
                      

    </div>

                 
                 
                 
                 
                 
                 
                 
                 </div><!-- end of x-panel div -->
              </div><!-- end of col-md-12 col-sm-12 col-xs-12 div -->
           </div><!-- end of row div -->
    </div><!-- end of FormDiv div --> 
  </div><!-- end of right col -->
 </div><!-- end of main body -->
</div><!-- end of container body -->
<div class="modal fade" id="test" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            
            <div class="modal-body">
                <Strong> Please Enter The Student ID Or Valid ID...</Strong>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-round btn-primary" data-dismiss="modal">OK</button>
               
                
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
  <!-- PNotify -->
    <script type="text/javascript" src="js/notify/pnotify.core.js"></script>
    <script type="text/javascript" src="js/notify/pnotify.buttons.js"></script>
    <script type="text/javascript" src="js/notify/pnotify.nonblock.js"></script>
     
  <script>
        NProgress.done();
   </script>
   <!-- /datepicker -->
  <!-- /footer content -->
</body>
</html>
 <%}%>
 