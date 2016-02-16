 <%@page import="in.jdsoft.studentmanagement.controller.StudentAcademicController"%>
<%@page import="in.jdsoft.studentmanagement.model.StudentAcademic"%>
<%@page import="in.jdsoft.studentmanagement.model.CourseSemester"%>
<%@page import="in.jdsoft.studentmanagement.controller.StudentRegistrationController"%>
<%@page import="in.jdsoft.studentmanagement.model.FeesTemplate"%>
<%@page import="in.jdsoft.studentmanagement.controller.FeesTemplateController"%>
<%@page import="in.jdsoft.studentmanagement.model.StudentRegistration"%>
<%@page import="in.jdsoft.studentmanagement.controller.CourseSemesterController"%>
<%@page import="in.jdsoft.studentmanagement.controller.CourseCategoryController"%>
<%@page import="in.jdsoft.studentmanagement.controller.GroupController"%>
<%@page import="in.jdsoft.studentmanagement.model.CourseCategory"%>
<%@page import="in.jdsoft.studentmanagement.model.Group"%>
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
  
 <%
 int courseSemId=Integer.parseInt(request.getParameter("courseSemId"));
 int categoryId=Integer.parseInt(request.getParameter("categoryId"));
    if(courseSemId!=0 && categoryId!=0){%>
         <!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Feed Results</title>

    <!-- Bootstrap core CSS -->

    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">

    <!-- Custom styling plus plugins -->
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/icheck/flat/green.css" rel="stylesheet">
    <link href="css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 

    <!--[if lt IE 9]>
        <script src="../assets/js/ie8-responsive-file-warning.js"></script>
        <![endif]-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

</head>


<body class="nav-md">

<div class="container body">
<div class="main_container">
<%@ include file="master_menu.jsp" %>
 <%@ include file="master_header.jsp" %>
<div class="right_col" role="main">

       <div class="">
                    <div class="clearfix"></div>

                    <div class="row"  id="studentListView">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                               <h2>Feed Students Results </h2>
                                   <div class="clearfix"></div>
                     </div><!-- end of x_title div -->
                      
                                   <br />
                         <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action="${pageContext.request.contextPath}/ResultServlet" method="post">
                             <!-- start of form-group 1 -->
                               <div class="x_content">
                                <div  class="table-responsive">
                                    <table id="example" class="table table-striped responsive-utilities jambo_table">
                                        <thead>
                                            <tr class="headings">
                                                <th>Student ID </th>
                                                <th>Student Name </th>
                                                <th>Date Of Birth</th>
                                                <th>Course Name </th>
                                                <th>Semester</th>
                                                <th class=" no-link last"><span class="nobr">Action</span>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <%
                                          StudentRegistrationController studentRegistration=new StudentRegistrationController();
                                          StudentAcademicController studentAcademic=new StudentAcademicController();
                                          CourseController courseController=new CourseController();
                                          ArrayList<StudentRegistration> students= studentRegistration.getStudentListFromCourseSemesterAndCategory(courseSemId, categoryId);
                                          session.setAttribute("students", students);
                                          for(StudentRegistration student:students){
                                            if(student.getResultsLock()==0){%>
                                             <tr class="even pointer">
                                                <td class=" "><%out.print(student.getStudentId());%></td>
                                              	<td class=" "><%out.print(student.getFirstname().concat(" "+student.getLastname()));%></td>
                                              	<td class=" "><%out.print(student.getDateOfBirth());%></td>
                                              	<td class=" "><%out.print(courseController.courseNameFromId(student.getCourseId())); %></td>
                                              	<td class=" "><%out.print(studentAcademic.studentCurrentSemester(student.getStudentId()));%></td>
                                              	<td class="last">
                                              	Pass:<input type="radio" class="flat" name="<%out.print(student.getStudentId());%>" id="genderM" value="pass" checked="checked" required />
                                              	Fail:<input type="radio" class="flat" name="<%out.print(student.getStudentId());%>" id="genderF" value="fail" />
                                              	Discontinue:<input type="radio" class="flat" name="<%out.print(student.getStudentId());%>" id="genderF" value="discontinue" />
                                              </td>
                                          </tr>  
                                          <% }
                                            }
                                           %>
                                            
                                        </tbody>
									 </table>
									 </div>
                                </div>
                                 <div class="x_title">
                                <div class="form-group"><!-- start of form group 5 -->
                           <!-- start of col-md-6 col-sm-6 col-xs-12 col-md-offset-3 -->
                              <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                    <a href="feedresults.jsp"class="btn  btn-danger btn-md" role="button"  >Cancel</a>             
                                   <button class="btn  btn-success btn-md"data-toggle="modal" data-target="#confirm" >Save</button>
                                   <div class="modal fade" id="confirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
               <h4>Confirmation?</h4> 
            </div>
            <div class="modal-body">
                <h5>Are you sure ?, You want to update results??</h5>
            </div>
            <div class="modal-footer">
                
                   <button type="button" class="btn btn-round btn-primary" data-dismiss="modal">Cancel</button>
                   <a   type="submit" href="generateInvoice.jsp"class="btn btn-round btn-success" role="button"  >Yes</a>
                  
                
            </div>
        </div>
    </div>
</div>
                                    
                               </div><!-- end of col-md-6 col-sm-6 col-xs-12 col-md-offset-3 -->
                            </div><!-- end of form group 5 -->
                            </div>
                            </form>
                         </div>
                        </div>

                        <br />
                        <br />
                        <br />

                    </div>
                </div>
            </div>
                <!-- /page content -->
            </div>

        </div>

        <div id="custom_notifications" class="custom-notifications dsp_none">
            <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
            </ul>
            <div class="clearfix"></div>
            <div id="notif-group" class="tabbed_notifications"></div>
        </div>

        <script src="js/bootstrap.min.js"></script>

        <!-- chart js -->
        <script src="js/chartjs/chart.min.js"></script>
        <!-- bootstrap progress js -->
        <script src="js/progressbar/bootstrap-progressbar.min.js"></script>
        <script src="js/nicescroll/jquery.nicescroll.min.js"></script>
        <!-- icheck -->
        <script src="js/icheck/icheck.min.js"></script>

        <script src="js/custom.js"></script>


        <!-- Datatables -->
        <script src="js/datatables/js/jquery.dataTables.js"></script>
        <script src="js/datatables/tools/js/dataTables.tableTools.js"></script>
        <script>
            $(document).ready(function () {
                $('input.tableflat').iCheck({
                    checkboxClass: 'icheckbox_flat-green',
                    radioClass: 'iradio_flat-green'
                });
            });

            var asInitVals = new Array();
            $(document).ready(function () {
                var oTable = $('#example').dataTable({
                    "oLanguage": {
                        "sSearch": "Search all columns:"
                    },
                    "aoColumnDefs": [
                        {
                            'bSortable': false,
                            'aTargets': [0]
                        } //disables sorting for column one
            ],
                    'iDisplayLength': 12,
                    "sPaginationType": "full_numbers",
                    "dom": 'T<"clear">lfrtip',
                    "tableTools": {
                        "sSwfPath": "<?php echo base_url('assets2/js/Datatables/tools/swf/copy_csv_xls_pdf.swf'); ?>"
                    }
                });
                $("tfoot input").keyup(function () {
                    /* Filter on the column based on the index of this element's parent <th> */
                    oTable.fnFilter(this.value, $("tfoot th").index($(this).parent()));
                });
                $("tfoot input").each(function (i) {
                    asInitVals[i] = this.value;
                });
                $("tfoot input").focus(function () {
                    if (this.className == "search_init") {
                        this.className = "";
                        this.value = "";
                    }
                });
                $("tfoot input").blur(function (i) {
                    if (this.value == "") {
                        this.className = "search_init";
                        this.value = asInitVals[$("tfoot input").index(this)];
                    }
                });
            });
        </script>

</body>
</html>
 <%}
}%>