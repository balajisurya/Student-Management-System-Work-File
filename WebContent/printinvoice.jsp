<%@page import="in.jdsoft.studentmanagement.controller.StudentRegistrationController"%>
<%@page import="in.jdsoft.studentmanagement.model.StudentRegistration"%>
<%@page import="in.jdsoft.studentmanagement.model.StudentAcademic"%>
<%@page import="in.jdsoft.studentmanagement.controller.ReceiptController"%>
<%@page import="in.jdsoft.studentmanagement.model.Receipt"%>
<%@page import="in.jdsoft.studentmanagement.controller.StudentAcademicController"%>
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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Print Invoice</title>

    <!-- Bootstrap core CSS -->

    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">

    <!-- Custom styling plus plugins -->
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/icheck/flat/green.css" rel="stylesheet">
    <link href="css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
    <script src="http://www.position-absolute.com/creation/print/jquery.min.js" type="text/javascript"></script>
     <script src="http://www.position-absolute.com/creation/print/jquery.printPage.js" type="text/javascript"></script>
     <script>
         $(document).ready(function() {
             $(".btnPrint").printPage();
         });
      </script>
      

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
                    <div class="page-title">
                        <div class="title_left">
                            <h3>
                     Print Invoices
                    
                </h3>
                        </div>
                 </div>

                    <div class="clearfix"></div>

                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                              
                                <div class="x_content">
                                <%
                                  ReceiptController studentReceipts=new ReceiptController();
                                  ArrayList<StudentAcademic> studentsReceipt= studentReceipts.currentSemesterInvoice();
                                  StudentRegistrationController studentController=new StudentRegistrationController();
                                  %>
                                     <table id="example" class="table table-striped responsive-utilities jambo_table">
                                    
                                        <thead>
                                            <tr class="headings">
                                                <th>Invoice No </th>
                                                <th>Student ID </th>
                                                <th>Student Name </th>
                                                
                                                <th>Course Id </th>
                                                <th>Semester</th>
                                                
                                                <th>Category Id</th>
                                                <th>Invoice Amount</th>
                                                <th class=" no-link last"><span class="nobr">Print</span>
                                                </th>
                                            </tr>
                                        </thead>
                                       <tbody>
                                  <% 
                                  for(StudentAcademic studentReceipt:studentsReceipt)
                                  {
                                    System.out.print(studentReceipt.getStudentId()+" "+studentReceipt.getReceiptId());
                                     Receipt receiptdetails=studentReceipts.getReceiptDetails(studentReceipt.getReceiptId());
                                     ArrayList<StudentRegistration> studentdetails= studentController.getStudentDetails(studentReceipt.getStudentId());%>
                                     
                                	  <tr class="even pointer">
                                	  
                                	  
                                      <td><%out.print(studentReceipt.getReceiptId());%></td>
                                      <%for(StudentRegistration studentDetail:studentdetails){%>
                                    	  <td class=" "><%out.print(studentDetail.getStudentId()); %></td>
                                          <td class=" "><%out.print(studentDetail.getFirstname()); %></td>
                                         <td class=" "><%out.print(studentDetail.getCourseId());%> </td>
                                          <td class=" "><%out.print(studentDetail.getCurrentSemester());%></td>
                                          <td class=" "><%out.print(studentDetail.getCategoryId());%></td>
                                          <td class="a-right a-right "><%out.print(receiptdetails.getTotalFees()); %></td>
                                          <td class=" last"><a class="btnPrint" href="studentInvoice.jsp?receiptId=<%out.print(studentReceipt.getReceiptId());%>">Print</a>
                                          </td>
                                	  <%}
                                	  %>
                                  </tr>
                                	 
                                  <%}
                                %>
                                    
                                        
                                            
                                        </tbody>
                                   </table>
                                </div>
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
 <%}%>