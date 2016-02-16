<%@page import="in.jdsoft.studentmanagement.model.Receipt"%>
<%@page import="in.jdsoft.studentmanagement.controller.ReceiptController"%>
<%@page import="in.jdsoft.studentmanagement.model.StudentFeesHistory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.jdsoft.studentmanagement.controller.StudentFeesHistoryController"%>
<%
if(session.getAttribute("authenticated")!="true"){
	response.sendRedirect("user_login.jsp");
 }
else{
	if(!request.getParameter("studentId").equals("")){%>
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
        

	
	
	<div class="x_title">
                                    <h2><i class="fa fa-align-left"></i> Student Invoice <small>All semesters</small></h2>
                                    
                                    <div class="clearfix"></div>
                                </div>
                            
                                     <div class="x_content">
                                    
                                       <div class="col-xs-3">
                                        <!-- required for floating -->
                                        <!-- Nav tabs -->
                                        <ul class="nav nav-tabs tabs-left">
                                        <%ReceiptController receiptController=new ReceiptController();
                                         ArrayList<Receipt> receipts= receiptController.getAllReceiptId(Integer.parseInt(request.getParameter("studentId")));
                                         int dummysemestercount=1; 		
                                         for(Receipt receipt:receipts){%>
                                            <li class="active"><a href=<%out.print("#r".concat(Integer.toString(receipt.getReceiptId())));%> data-toggle="tab"><%out.print("semester".concat(Integer.toString(dummysemestercount))); %></a></li>
                                        <%dummysemestercount++;
                                        }int checkactiveReceipt=1;%>
                                         </ul>
                                    </div>

                                    <div class="col-xs-9">
                                        <!-- Tab panes -->
                                        <div class="tab-content">
                                        <%for(Receipt receipt:receipts){%>
                                        	<div class="<%if(checkactiveReceipt==1){out.print("tab-pane active");}else{out.print("tab-pane");}%>" id=<%out.print("r".concat(Integer.toString(receipt.getReceiptId())));%>>
                                                <h4>Receipt Id:<%out.print(receipt.getReceiptId()); %><br>
                                                <br><a class="btnPrint" href=""><span class="glyphicon glyphicon-print" ></span> Print</a></h4>
                                                <div class="table-responsive">
                                                              						<table  class="table table-bordered" >
                                                                      					    <thead>
                                                                              					<tr class="default">
                                                                                  					<th class="text-center">Serial No</th>
                                                                                  					<th class="text-center">Fees</th>
                                                                                  					<th class="text-center" >Amount (Kshs)</th>
                                                                              					</tr>
                                                                    						</thead>
                                                             						        <tbody>
                                                             						        <%
                                                             						        StudentFeesHistoryController studentFeesHistory=new StudentFeesHistoryController();
                                                             						        ArrayList<StudentFeesHistory> feesItems=studentFeesHistory.getFeesItemsOfReceipt(receipt.getReceiptId());
                                                             						        int SNO=1;
                                                             						        for(StudentFeesHistory feesItem:feesItems){
                                                             						        %>
                                                             						        	<tr>
                                                                                          				<th class="text-center" ><%out.print(SNO); %></th>
                                                                                          				<td class="text-center"><%out.print(feesItem.getTemplateItemName());%></td>
                                                                                          				<td class="text-right"><%out.print(feesItem.getTemplateItemAmount());%></td>
																								 </tr>
                                                             						        <%SNO++;}
                                                             						        %>
																								 
																			   				</tbody>
																	                         
                                                                                      </table>
                                                    							 </div>
                                            </div>
                                        <%checkactiveReceipt++;}	
                                        %>
                                        
                                            
                                        </div>
                                    </div>

                                    <div class="clearfix"></div>
                           </div>
                           </div>
                           </div>
                        
                          
	
	<%
	}
 }
%>

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
