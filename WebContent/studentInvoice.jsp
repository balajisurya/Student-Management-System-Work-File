<%@page import="in.jdsoft.studentmanagement.model.StudentFeesHistory"%>
<%@page import="in.jdsoft.studentmanagement.controller.StudentFeesHistoryController"%>
<%@page import="in.jdsoft.studentmanagement.model.StudentRegistration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.jdsoft.studentmanagement.controller.StudentRegistrationController"%>
<%@page import="in.jdsoft.studentmanagement.model.Receipt"%>
<%@page import="in.jdsoft.studentmanagement.controller.ReceiptController"%>
<%
		if(session.getAttribute("authenticated")!="true"){
		response.sendRedirect("user_login.jsp");
		  }
		else{
		if(request.getParameter("receiptId")!=null){%>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Student Invoice </title>
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
      <link href="css/animate.min.css" rel="stylesheet">
      <link href="css/custom.css" rel="stylesheet">
      <link href="css/icheck/flat/green.css" rel="stylesheet">
      <link href="css/style.css" rel="stylesheet" type="text/css" />
          <script src="js/jquery.min.js"></script>
</head>

<body class="nav-md">
    <div class="container body">
          <div class="main_container">
                <div class="right_col" role="main">
                     <div class="">
                          <div class="clearfix"></div>
                               <div class="row">
                                     <div class="col-md-12 col-sm-9 col-xs-12">
                                          <div class="x_panel">
                                               <div class="x_content">
                                                     <section class="content invoice">
                                                              <div class="row">
                                                                   <div class="col-md-12 col-sm-12 col-xs-12">
                                                                        <div class="col-sm-9 col-md-9 col-sm-9 col-xs-12">
														                     <div class="x_title">
													 							  <img src="images/banner.png" alt="" style="width:1000px;height:128px;">
											                                 </div>
                                                                        </div>
                                                                   </div>
											                  </div>
                                                              <div class="row">
													    		   <div class="col-md-12 col-sm-12 col-xs-12">
                                                          				<div class="col-sm-4 pull-right">
                                                						     <div class="table-responsive">
                                                    							<table class="table table-bordered">
                                                        							<tbody>
                                                            							 <tr>
                                                                							 <th>Invoice ID:</th>
                                                                							 <td class="text-right"><%out.print(Integer.parseInt(request.getParameter("receiptId")));%></td>
                                                                						</tr>
                                                            							  <tr>
                                                            							  <%ReceiptController receiptController=new ReceiptController();
                                                            							     Receipt receipt= receiptController.getReceiptDetails(Integer.parseInt(request.getParameter("receiptId")));%>
                                                                							 <th>Student ID:</th>
                                                                							 <td class="text-right"><%out.print(receipt.getStudentId());%></td>
                                                            							   </tr>
                                                        							 </tbody>
                                                    							 </table>
                                                							    </div>
                                         								   </div>
                                           								<div class="col-sm-4 pull-left">
                                                                 			 <div class="table-responsive">
                                                    							  <table class="table table-bordered">
                                                                                         <tbody>
                                                            								<%StudentRegistrationController studentController=new StudentRegistrationController();
                                                            								  ArrayList<StudentRegistration> studentDetails= studentController.getStudentDetails(receipt.getStudentId()); 
                                                            								  for(StudentRegistration student:studentDetails){%>
                                                            								  <tr>
                                                            								 		<th>Student Name:</th>
                                                            								        <td class="text-right"><%out.print(student.getFirstname().concat(" "+student.getLastname())); %></td>
                                                            								  </tr>
                                                            								  <tr>
                                                                								    <th>Receipt For Semester</th>
                                                                								    <td class="text-right"><%out.print(receipt.getSemester());%></td>
                                                            								  </tr>
                                                            								  <%}%>
                                                            							 </tbody>
                                                    								</table>
                                                                               </div>
                                           								  </div>
                                                                     </div>
													            </div><!-- /.row -->
                                        						<div class="row"><!-- Table row -->
												                     <div class="col-md-12 col-sm-12 col-xs-12">
													 					  <div class="x_content">
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
                                                             						        ArrayList<StudentFeesHistory> feesItems=studentFeesHistory.getFeesItemsOfReceipt(Integer.parseInt(request.getParameter("receiptId")));
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
                            										   </div>
                         										  </div>	<!-- /.row -->
																 <div class="row">
                                            						<div class="col-md-5  pull-right" >
                                              							 <div class="table-responsive">
                                                    							<table class="table table-bordered">
                                                        							<tbody>
                                                        							<% double currentSemesterFee=receipt.getTotalFees();
                                                        							   double totalPendingFee=studentFeesHistory.getTotalPendingFee(receipt.getStudentId());
                                                        							   double previousFees=totalPendingFee-currentSemesterFee;%>
                                                        							   
                                                            							
                                                            							<%if(previousFees>0){%>
                                                            							  <tr>
                                                                							<th class="text-center">Subtotal(Kshs):</th>
                                                               							    <td class="text-right"><%out.print(currentSemesterFee); %></td>
                                                            						   	</tr>
                                                            							   <tr>
                                                                							<th class="text-center">Previous Balance(Kshs):</th>
                                                                							<td class="text-right"><%out.print(previousFees); %></td>
                                                            							 </tr>
                                                            							<%}%>
                                                            							 <tr>
                                                                							  <th class="text-center">Total(Kshs):</th>
                                                                							  <td class="text-right"><%out.print(totalPendingFee); %></td>
                                                            							 </tr>
                                                        							 </tbody>
                                                  							     </table>
                                               							    </div>
                                           							   </div>
                                        						  </div>
                                 							   </section>
                             							  </div>
                          							</div>
				   	 						   </div>
                 						  </div>
             						</div>
                    		   </div>
           				 </div>
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
</body>
</html>
<%}
	else{
		response.sendRedirect("dashboard.jsp");	
	 }
}%>