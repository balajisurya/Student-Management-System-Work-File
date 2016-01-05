<%@page import="in.jdsoft.studentmanagement.model.CourseSemester"%>
<%@page import="in.jdsoft.studentmanagement.controller.CourseSemesterController"%>
<%@page import="in.jdsoft.studentmanagement.model.Courses"%>
<%@page import="in.jdsoft.studentmanagement.controller.CourseController"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.jdsoft.studentmanagement.model.Group"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.jdsoft.studentmanagement.controller.GroupController"%>
<%@page errorPage="error.jsp" %>
<%
		if(session.getAttribute("authenticated")!="true"){
		response.sendRedirect("user_login.jsp");
		  }
		else{
%>
  		
   		<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Groups</title>
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
    <script src="//oss.maxcdn.com/bootbox/4.2.0/bootbox.min.js"></script>
    <script src="js/mycustom/autosearch.js" ></script>
    <script src="js/mycustom/crud.js" ></script>
    <script src="//code.jquery.com/jquery-1.8.2.min.js"></script> 
    <script type = "text/javascript"  src = "http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    
    
</head>
<body class="nav-md">
  <div class="container body">
    <div class="main_container">
    <%@ include file="master_menu.jsp" %>
   		<%@ include file="master_header.jsp" %>
      <div class="right_col" role="main">
        <div id="ListDiv" style="display:block;"> <br>
          <br />
 				<h3>Groups</h3>
 				<div class="x_title">
 				  <div class="clearfix">
 				  </div>
 				</div> 
 				  <div class="x_title">
 				  <div class="clearfix">
 				  <button type="button" class="btn btn-primary col-md-2" name="addGroup" onclick="showDiv()"><span class="glyphicon glyphicon-plus-sign" ></span>  Add Group</button>
 				  <button type="button" class="btn btn-success col-md-2" name="importExcel"><span class="glyphicon glyphicon-upload" ></span>  Export Excel</button>
 				  <button type="button" class="btn btn-warning col-md-1" name="print"><span class="glyphicon glyphicon-print" ></span>  Print</button>
 				  <input type="text" class="form-control col-md-2" id="search" placeholder="Group Search " style="width: 200px;margin-left: 400px"/>
 				  </div>
 				</div>
 					<%
 					GroupController groupController=new GroupController();
 					ArrayList<Group> groups=groupController.viewGroups();
 					CourseController courseController=new CourseController();
 					CourseSemesterController courseSemester=new CourseSemesterController();
 					ArrayList<CourseSemester> courseSemesterList=courseSemester.getAllCourseSemesters();
 					int groupCount=groups.size();
 					%>
 					<h3>Groups Created[<%out.print(groupCount);%>]</h3>
 					<div  class="x_panel">
     					<div class="table-responsive">
    <table  id="table" class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>S.NO</th>
                <th>Group Name</th>
                <th>Students In Group</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
 			if(groupCount>0){
 				int SNO=1;
 				int studentCount=28;
 				for(Group group:groups){	
 		%>
            <tr>
                <td style="width:100px"><%out.print(SNO);%></td>
                <td><%out.print(group.getGroupName());%></td>
                <td style="width:150px"><%out.print(studentCount);%></td>
                <td style="width: 250px">
                  
             
                   <a href="#"  data-href="#" data-id="" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#confirm-edit">
                           <span class="glyphicon glyphicon-edit"></span> 
                   </a>
                   <a href="#"  data-href="#" data-id="" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#confirm-delete">
                           <span class="glyphicon glyphicon-trash"></span> 
                   </a>
                </td>
            </tr>
           <% SNO++;
              studentCount+=5;}
           }
           else{%>
        	   <tr>
                <td colspan="5" align="center">No Groups Available</td>
              </tr>
          <% }%>
        </tbody>
    </table>
</div>
</div>
  </div><!-- end of LisDiv div -->
  
    <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                                </button>
               <h4>Confirmation?</h4> 
            </div>
            <div class="modal-body">
                <h5>Are you sure ?, You want to delete this Group??</h5>
            </div>
            <div class="modal-footer">
               
                <button class="btn btn-round btn-danger" data-dismiss="modal" onclick="new PNotify({
                                title: 'Notification',
                                text: 'successfully deleted',
                                type: 'success'
                            });">Delete</button>
                
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="confirm-edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                                </button>
               <h4>Edit Group</h4> 
            </div>
            <div class="modal-body">
                 <form class="form-horizontal" role="form">
                  		
                        <div class="form-group">
                    	  <label  class="col-sm-3 control-label" for="coursename">Group Name</label>
                    	    <div class="col-sm-9">
                        		<input type="text" class="form-control" id="groupname" placeholder="" required="required"/>
                            </div>
                        </div>
                        
                        <div class="modal-footer">
                        
                		<button type="submit" class="btn btn-round btn-success" >Update</button>
                      </div>
                 </form>
    
            </div>
            
        </div>
    </div>
</div>








                                
	<div id="FormDiv" style="display: none;"> 
       <div class="clearfix"></div><!-- end of clearfix div -->
           <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                 <div class="x_panel" style="height:500px;">
                    <div class="x_title">
                               <h2>CREATE A GROUP <small>(add new group)</small></h2>
                                   <div class="clearfix"></div>
                     </div><!-- end of x_title div -->
                      <div class="x_content">
                                   <br />
                         <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action="${pageContext.request.contextPath}/GroupServlet" method="post">
                             <!-- start of form-group 1 -->
                             <div class="form-group">
                                  <label class="control-label col-md-3 col-sm-3 col-xs-12" for="group-name">Group Name <span class="required">*</span>
                                   </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                         <input name="group-name" type="text" id="group-name" required class="form-control col-md-7 col-xs-12">
                                     </div>
                              </div>
                              <!-- end of form-group 1 -->
                              
                              <!-- start of form-group 2 -->          
                              <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Courses For This Group</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select  name="courseSemList"class="select2_multiple form-control" multiple="multiple" style="width:495px" >
                                                <%
                                                int courseSemestersCount=courseSemesterList.size();
                             					if(courseSemestersCount>0){
                             					 for(CourseSemester courseSem:courseSemesterList){%>
                                                    <option value="<%out.print(courseSem.getCourseSemesterId());%>"><%out.print(courseController.courseDetailsFromId(courseSem.getCourseId()).get("course_name")+"  "+"Semester"+" "+courseSem.getCourseSemester());%></option>
                                                  <%}
                             					 }
                             					 else{%>
                             					 <option></option>
                             					 <%} %>  
                                                </select>
                                            </div>
                                        </div>
                              <!-- end of form-group 2 -->
                       <div class="ln_solid"></div>
                           <div class="form-group"><!-- start of form group 5 -->
                           <!-- start of col-md-6 col-sm-6 col-xs-12 col-md-offset-3 -->
                              <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                 <button type="button" class="btn btn-primary" onclick="showDiv()">Cancel</button>
                                    
                                               	<button type="reset" class="btn btn-info">Clear</button>
                                                <button type="submit" class="btn btn-success" name="save">save</button>               
                                </div><!-- end of col-md-6 col-sm-6 col-xs-12 col-md-offset-3 -->
                            </div><!-- end of form group 5 -->
                         </form><!-- end of form -->
                      </div><!-- end of x-content div -->
                 </div><!-- end of x-panel div -->
              </div><!-- end of col-md-12 col-sm-12 col-xs-12 div -->
           </div><!-- end of row div -->
    </div><!-- end of FormDiv div -->
  </div><!-- end of right col -->
 </div><!-- end of main body -->
</div><!-- end of container body -->

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
  <!-- select2 -->
        <script src="js/select/select2.full.js"></script>

  <!-- select2 -->
        <script>
            $(document).ready(function () {
                $(".select2_single").select2({
                    placeholder: "Select a group",
                    allowClear: true
                });
                $(".select2_group").select2({});
                $(".select2_multiple").select2({
                    maximumSelectionLength: null,
                    placeholder: "click here",
                    allowClear: true
                });
            });
        </script>
   <!-- /select2 -->
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
 