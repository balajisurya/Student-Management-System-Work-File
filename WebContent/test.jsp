<!DOCTYPE html>
<%@page import="in.jdsoft.studentmanagement.model.FeesTemplate"%>
<%@page import="in.jdsoft.studentmanagement.controller.FeesTemplateController"%>
<%@page import="in.jdsoft.studentmanagement.model.CourseCategory"%>
<%@page import="in.jdsoft.studentmanagement.controller.CourseCategoryController"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.jdsoft.studentmanagement.controller.CourseController"%>
<%@page import="in.jdsoft.studentmanagement.model.Courses"%>
<%
if(session.getAttribute("authenticated")!="true"){
	response.sendRedirect("user_login.jsp");
 }
else{%>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Institution</title>

    <!-- Bootstrap core CSS -->

    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">

    <!-- Custom styling plus plugins -->
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/icheck/flat/green.css" rel="stylesheet">
    <!-- editor -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
    <link href="css/editor/external/google-code-prettify/prettify.css" rel="stylesheet">
    <link href="css/editor/index.css" rel="stylesheet">
    <!-- select2 -->
    <link href="css/select/select2.min.css" rel="stylesheet">
    <!-- switchery -->
    <link rel="stylesheet" href="css/switchery/switchery.min.css" />
    <link rel="stylesheet" href="http://jqueryvalidation.org/files/demo/site-demos.css">

    
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
     <script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>

   
      <script type = "text/javascript">
         $(document).ready(function() {
        	 
        	 
        	 var test=null;
        	 $("#reg").click(function(){
        		  
        		  var test =$('#formreg').validate();
        		   
        		   return test;
        		   });
        	 if(test!==null){

	    	 $('#regmodal').modal('show');
	    	  return false;
        	 }
         
        	 $('#in-submit').click(function(){
        		 
        		 $.ajax({
        			    type : 'POST',
        			    url : '/InstitutionServlet',
        			    data : $('#formreg').serialize() + "&action=save"
        			});
        		 
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
   
</head>
<body class="nav-md">
  <div class="container body">
    <div class="main_container">
       <!-- page content -->
       <%@ include file="master_menu.jsp" %>
   <%@ include file="master_header.jsp" %>
       <div class="right_col" role="main">
       
          <br />
            <div class="x_panel" style="height:auto;">
               <div class="title_left">
                  <h3>Fill Institution Details</h3>
                     <div class="x_title">
                     </div>
               </div>
                <div class="x_content">
                    <br />
                    <form id="formreg" method="post" class="form-horizontal form-label-left">
          
                         <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Institution Name <span class="required">*</span>
                             </label>
                              <div class="col-md-6 col-sm-6 col-xs-12">
                                  <input type="text" id="institute-name" name="institute-name" required="required" class="form-control col-md-7 col-xs-12">
                              </div>
                         </div>
                       <div class="form-group">
                              	<label class="control-label col-md-3 col-sm-3 col-xs-12">Institution Description <span class="required">*</span>
                               	</label>
                               	 <div class="col-md-6 col-sm-6 col-xs-12">
                                  	<input type="text" id="institute-desc" name="institute-desc" required="required" class="form-control col-md-7 col-xs-12">
                                 </div>
                                </div>   
                                   
                            	<div class="form-group">
                                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="image_path">Institute Logo <span class="required">*</span>
                                       </label>
                                       <div class="col-md-55">
                                            <div class="thumbnail" style="height: 70%; width:70%">
                                                <div class="image view view-first" style="height: 100%; width:100%">
                                                    <img id="thumbnil" style="width:100%;  display: block;" src="images/user.png" alt="image" />
                                                    <div class="mask">
                                                    	<input name="photo" type="file" class="btn-primary" style="display:block;" accept="image/*" onchange="showMyImage(this)" required="required"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                                
                            <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="student_email">Institute Email<span class="required">*</span>
                                        </label>
                                           <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="email" id="institute-email" name="institute-email" required="required" class="form-control col-md-7 col-xs-12">
                                           </div>
                                 </div>
                                 
                                     <div class="form-group">
                              <label class="control-label col-md-3 col-sm-3 col-xs-12">Institution Address Line 1 <span class="required">*</span>
                               </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                  <input type="text" id="institute-add1" name="institute-add1" required="required" class="form-control col-md-7 col-xs-12">
                                 </div>
                          </div>
                          
                           <div class="form-group">
                              <label class="control-label col-md-3 col-sm-3 col-xs-12">Institution Address Line 2 <span class="required">*</span>
                               </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                  <input type="text" id="institute-add2" name="institute-add2" required="required" class="form-control col-md-7 col-xs-12">
                                 </div>
                          </div>
                          
                          <div class="form-group">
                              <label class="control-label col-md-3 col-sm-3 col-xs-12">Institution Admin Name <span class="required">*</span>
                               </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                  <input type="text" id="institute-admin-name" name="institute-admin-name" required="required" class="form-control col-md-7 col-xs-12">
                                 </div>
                          </div>
                          
                           <div class="form-group">
                               			<label class="control-label col-md-3 col-sm-3 col-xs-12">Institution City <span class="required">*</span></label>
                                			<div class="col-md-6 col-sm-6 col-xs-12">
                                				<select class="form-control" id="institute-city" name="institute-city" required="required">
                                					<option value="" disabled selected>Select City</option>
                                   	  				<option value="Nairobi">Nairobi</option>
                                   	  				<option value="Colombo">Colombo</option>
                                   	  				<option value="Delhi">Delhi</option>
                                 				</select>
                                 			</div>
                            </div>
                            
                            
                          
                            <div class="form-group">
                                         <label class="control-label col-md-3 col-sm-3 col-xs-12" for="contact_number">Institution Contact<span class="required">*</span>
                                         </label>
                                         <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="institute-contact" name="institute-contact" required="required" class="form-control col-md-7 col-xs-12"   onkeypress="return isNumber(event)">
                                         </div>
                             </div>
                
                                    <div class="form-group">
                               			<label class="control-label col-md-3 col-sm-3 col-xs-12">Institute Country <span class="required">*</span></label>
                                			<div class="col-md-6 col-sm-6 col-xs-12">
                                			<div class="radio">
                                				<select class="form-control" id="institute-country" name="institute-country" required="required">
                                					<option value="" disabled selected>Select Country</option>
                                   	  				<option value="Kenya"> Kenya </option>
                                   	  				<option value="Srilanka"> Srilanka </option>
                                   	  				<option value="India">India</option>
                                 				</select>
                                 			</div>
                                 			</div>
                                    </div>
                 
                             <div class="ln_solid"></div>
                                     <div class="form-group">
                                             <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                              
                                                 <button type="reset" class="btn btn-info">Clear</button>
                                                 <button  class="btn btn-success" id="reg">Register</button>
                                             </div>
                                        </div>
                                        
                                      
                                        
                               
    						
    							
                                        
                    </form>
                     <div class="modal fade" id="regmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
    <form>
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                                </button>
               <h4>Confirmation?</h4> 
            </div>
            <div class="modal-body">
                <h5>Are you sure ?, You want to add this Institute??</h5>
            </div>
            <div class="modal-footer">
                
                <button type="submit" id="in-submit" class="btn btn-round btn-success" data-dismiss="modal" onclick="new PNotify({
                                title: 'Notification',
                                text: 'successfully added',
                                type: 'success'
                            }); test();">OK</button>
                
            </div>
        </div>
        </form>
    </div>
</div>
                </div>

            </div><!--x-panel  -->
        </div><!--/right_col-->
    </div><!--/main_container-->
  </div><!-- /container_body -->
  
  
        
    
  
        
               
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
     <script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>



  
  
     <script src="js/bootstrap.min.js"></script>

        <!-- chart js -->
        <script src="js/chartjs/chart.min.js"></script>
        <!-- bootstrap progress js -->
        <script src="js/progressbar/bootstrap-progressbar.min.js"></script>
        <script src="js/nicescroll/jquery.nicescroll.min.js"></script>
        <!-- icheck -->
        <script src="js/icheck/icheck.min.js"></script>

        <script src="js/custom.js"></script>
        <!-- formHide jquery -->
  		  <script type="text/javascript" src="js/formHide.js"></script>
 	    <!-- /formHide jquery -->
<script src="js/profile_pic.js"></script>
        <!-- Datatables -->
        <script src="js/datatables/js/jquery.dataTables.js"></script>
        <script src="js/datatables/tools/js/dataTables.tableTools.js"></script>
        
        <!-- PNotify -->
    <script type="text/javascript" src="js/notify/pnotify.core.js"></script>
    <script type="text/javascript" src="js/notify/pnotify.buttons.js"></script>
    <script type="text/javascript" src="js/notify/pnotify.nonblock.js"></script>
      <!-- input mask -->
    <script src="js/input_mask/jquery.inputmask.js"></script>
    <!-- input_mask -->
    <script>
        $(document).ready(function () {
            $(":input").inputmask();
        });
    </script>
    <!-- /input mask -->
    </body>
</html>
<%} %>
