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
    <title>Registration </title>

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

    
 

   
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
     <script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
    <script type = "text/javascript">
         $(document).ready(function() {
        	 $("#reg").click(function(){
        		 
        	
        		   $('#formreg').validate({
        				   submitHandler: function(form) {
        			      
        			          

        					   $('#regmodal').modal('show');
        			        
        			            return false;     
        			        }
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
    <script>
$(document).ready(function() {
$('#courses-list').change(function(event) {
        var courseid = $("select#courses-list").val();
        $.get('StudentRegistartionServlet', {
                courseId : courseid
        }, function(response) {
        var select = $('#semester-joined');
        select.find('option').remove();
        
          $.each(response, function(index, value) {
        	    $('<option>').val(value).text(value).appendTo(select);
        	  
      });
        });
        });
});
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
                  <h3>Student Registration</h3>
                     <div class="x_title">
                     </div>
               </div>
                <div class="x_content">
                    <br />
                    <form id="formreg" action="" method="post" class="form-horizontal form-label-left">
           <div class="col-md-6 col-xs-12">
                         <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">First Name <span class="required">*</span>
                             </label>
                              <div class="col-md-9 col-sm-9 col-xs-12">
                                  <input type="text" id="first-name" name="first-name" required="required" class="form-control col-md-7 col-xs-12">
                              </div>
                         </div>
                         
                          <div class="form-group">
                              <label class="control-label col-md-3 col-sm-3 col-xs-12">Last Name <span class="required">*</span>
                               </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                  <input type="text" id="last-name" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
                                 </div>
                          </div>
                          
                          <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Guardian-First Name <span class="required">*</span>
                                 </label>
                                 <div class="col-md-9 col-sm-9 col-xs-12">
                                       <input type="text" id="guardianfirst-name" name="guardianfirst-name" required="required" class="form-control col-md-7 col-xs-12">
                                 </div>
                          </div>
                          
                           <div class="form-group">
                                  <label class="control-label col-md-3 col-sm-3 col-xs-12">Guardian-Last Name <span class="required">*</span>
                                   </label>
                                   <div class="col-md-9 col-sm-9 col-xs-12">
                                       <input type="text" id="guardianlast-name" name="guardianlast-name" required="required" class="form-control col-md-7 col-xs-12">
                                   </div>
                            </div>
                            
                            <div class="form-group">
                                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Gender <span class="required">*</span></label>
                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                     <div class="radio">
                                         <select class="form-control" id="sex" name="sex" required="required">
                                        <option value="" disabled selected>Select Sex</option>
                                             
                                                 		<option >Male</option>
                                                 		<option >Female</option>
                                             	
                                          </select>
                                      </div>
                                    </div>
                            </div>
                                   <div class="form-group">
                                         <label class="control-label col-md-3 col-sm-3 col-xs-12">Date Of Birth <span class="required">*</span>
                                          </label>
                                           <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input id="birthday"  data-inputmask="'mask': '99/99/9999'" name="student_dob" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text">
                                              
                                           </div>
                                   </div>
                             <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="student_email">Email ID <span class="required">*</span>
                                        </label>
                                           <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="email" id="student_email" name="student_email" required="required" class="form-control col-md-7 col-xs-12">
                                           </div>
                                 </div>
                                 
                                  <div class="form-group">
                                         <label class="control-label col-md-3 col-sm-3 col-xs-12" for="contact_number">Contact Number <span class="required">*</span>
                                         </label>
                                         <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="text" id="contact_number" name="contact_number" required="required" class="form-control col-md-7 col-xs-12"   onkeypress="return isNumber(event)">
                                         </div>
                                  </div>
                                  
                                  
                                 
                                   
                                
            					  
                                   
                                   
                            
                                       
                                <div class="form-group">
                                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="image_path">Student Photo <span class="required">*</span>
                                       </label>
                                       <div class="col-md-55">
                                            <div class="thumbnail" style="height: 100%; width:180%">
                                                <div class="image view view-first" style="height: 100%; width:100%">
                                                    <img id="thumbnil" style="width:100%;  display: block;" src="images/user.png" alt="image" />
                                                    <div class="mask">
                                                    	<input name="photo" type="file" class="btn-primary" style="display:block;" accept="image/*" onchange="showMyImage(this)" required="required"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                                
                                </div>
                                 <div class="col-md-6 col-xs-12">  
                                       <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address_line_1">Address Line 1 <span class="required">*</span>
                                            </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                            
                                                <input type="text" id="address_line1" name="address_line_1" required="required" class="form-control col-md-7 col-xs-12">

                                                
                                            </div>
                                    </div>
                                    
                                    <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address_line_2">Address Line 2 <span class="required">*</span>
                                            </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                 <input type="text" id="address_line2" name="address_line_2" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                    </div>
                                    <div class="form-group">
                               			<label class="control-label col-md-3 col-sm-3 col-xs-12">Country <span class="required">*</span></label>
                                			<div class="col-md-9 col-sm-9 col-xs-12">
                                			<div class="radio">
                                				<select class="form-control" id="countryd" name="country" required="required">
                                					<option value="" disabled selected>Select Country</option>
                                   	  				<option> Kenya </option>
                                   	  				<option> Srilanka </option>
                                   	  				<option>India</option>
                                 				</select>
                                 			</div>
                                 			</div>
                                    </div>
                                    
                                     
                                     <div class="form-group">
                               			<label class="control-label col-md-3 col-sm-3 col-xs-12">City <span class="required">*</span></label>
                                			<div class="col-md-9 col-sm-9 col-xs-12">
                                				<select class="form-control" id="city" name="city" required="required">
                                					<option value="" disabled selected>Select City</option>
                                   	  				<option>Nairobi</option>
                                   	  				<option >Colombo</option>
                                   	  				<option >Delhi</option>
                                 				</select>
                                 			</div>
                                    </div>
                                        
                                        <div class="form-group">
                                           <label class="control-label col-md-3 col-sm-3 col-xs-12" for="post_code">Post Code <span class="required">*</span>
                                            </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="text" id="post_code" name="post_code" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                       </div>
                                   
                                    <div class="form-group">
                                           <label class="control-label col-md-3 col-sm-3 col-xs-12" for="passport-number">Passport Number <span class="required">*</span>
                                           </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="text" id="passport-number" name="passport-number" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                     </div>
                            
                                <div class="form-group">
                                         <label class="control-label col-md-3 col-sm-3 col-xs-12">Date Of Admission <span class="required">*</span>
                                          </label>
                                           <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input name="date_of_joining"  data-inputmask="'mask': '99/99/9999'" id="date_of_joining" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text">
                                           </div>
                                   </div>
                       <div class="form-group">
                                  <label class="control-label col-md-3 col-sm-3 col-xs-12">Category <span class="required">*</span></label>
                                     <div class="col-md-9 col-sm-9 col-xs-12">
                                         <select class="form-control" name="category" required="required">
                                         <option value="" disabled selected>Select Category</option>
                                              <%
                                              		CourseCategoryController courseCategoryController=new CourseCategoryController();
                                             		ArrayList<CourseCategory> categories =courseCategoryController.getCategoryList();
                                              		if(categories.size()>0){
                                            			for(CourseCategory category:categories){  
                                              			%>
                                                 			<option value="<%out.print(category.getCategoryId()); %>"><%out.print(category.getCategoryName()); %></option>
                                              			<%}
                                            		}
                                              %>
                                          </select>
                                      </div>
                                </div>
               
                                 <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Course Name <span class="required">*</span></label>
                                     <div class="col-md-9 col-sm-9 col-xs-12">
                                        <select class="form-control" id="courses-list" name="courses-list" required="required">
                                        <option value="" disabled selected>select joining course </option>
                                             <%
                                               	CourseController courseController=new CourseController();
                                              	ArrayList<Courses> courses=courseController.viewCourse();
                                              	if(courses.size()>0){
                                            		for(Courses course:courses){  
                                             		%>
                                                 		<option value="<%out.print(course.getCourseId()); %>"><%out.print(course.getCourseName()); %></option>
                                             		<%}
                                            	}%>
                                          </select>
                                      </div>
                             </div>
                                        
                            <div class="form-group">
                               <label class="control-label col-md-3 col-sm-3 col-xs-12">Semester <span class="required">*</span></label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                	<select class="form-control" id="semester-joined" name="semester-joined" required="required">
                                	<option value="" disabled selected>Select Course First </option>
                                   	</select>
                                 </div>
                             </div>
                                        
                             
                                     
                                     <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Fees Structure <span class="required">*</span></label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <select class="form-control" name="feesTemplateId" required="required">
                                                <option value="" disabled selected>Select Fees Structure </option>
                                                 <%FeesTemplateController feesTemplateController=new FeesTemplateController();
                                                   ArrayList<FeesTemplate> feesTemplates= feesTemplateController.viewTemplates();
                                                   for(FeesTemplate feesTemplate:feesTemplates){%>
                                                   <option value="<%out.print(feesTemplate.getTemplateId());%>"><%out.print(feesTemplate.getTemplateName()); %></option>
                                                   <%
                                                   }%>
                                                </select>
                                            </div>
                                      </div>
                                      
                                      <div class="ln_solid"></div>
                                     <div class="form-group">
                                             <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                              
                                                 <button type="reset" class="btn btn-info">Clear</button>
                                                 <button type="submit" class="btn btn-success" id="reg">Register</button>
                                             </div>
                                        </div>
                                        
                                      
                                        
                                </div>       
    						
    							
                                        
                    </form>
                     <div class="modal fade" id="regmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                                </button>
               <h4>Confirmation?</h4> 
            </div>
            <div class="modal-body">
                <h5>Are you sure ?, You want to add this student??</h5>
            </div>
            <div class="modal-footer">
                
                <button type="submit" class="btn btn-round btn-success" data-dismiss="modal" onclick="new PNotify({
                                title: 'Notification',
                                text: 'successfully added',
                                type: 'success'
                            });">OK</button>
                
            </div>
        </div>
    </div>
</div>
                </div>

            </div><!--x-panel  -->
        </div><!--/right_col-->
    </div><!--/main_container-->
  </div><!-- /container_body -->
  
  
        
    
  
        
               
  
  
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
    </body>
</html>
<%} %>
