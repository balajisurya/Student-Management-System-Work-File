
<%@page import="in.jdsoft.studentmanagement.model.Courses"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.jdsoft.studentmanagement.controller.CourseController"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="error.jsp" %>
<%
		if(session.getAttribute("authenticated")!="true"){
		response.sendRedirect("user_login.jsp");
		  }
		else{
		if(request.getParameter("receiptId")!=null){%>
		
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

    


        <div class="main_container">

            
<!-- page content -->
            <div class="right_col" role="main">

                <div class="">
                   
                    <div class="clearfix"></div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="x_panel">
                                
                               <!--  --> <div class="x_content">

                                    <section class="content invoice">
                                        <!-- title row -->
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12 col-xs-12" invoice-header">
                                             
                                            <div class="col-sm-9 ">
											<div class="x_title">
													 
											<img src="images/banner.png" alt="" style="width:700px;height:128px;">
											</div>
                                            </div>
                                          
                                            
                                            </div>
                                             
                                            <!-- /.col -->
											
                                        </div>
                                        <div>
                                        <!-- info row -->
                                        <div class="row invoice-info">
                                            <div class="col-sm-8 invoice-col">
                                               
                                                <address>
                                        <strong>College Address.</strong>
                                        <br>795 Freedom Ave, Suite 600
                                        <br>New York, CA 94107
                                        <br>Phone: 1 (804) 123-9876
                                        <br>Email: ironadmin.com
                                    </address>
                                            </div>
                                            <!-- /.col -->
                                            <div class="col-sm-4 invoice-col">
                                                
                                                <address>
                                        <strong>Student Details</strong>
                                        <br>Name: Rahul
                                        <br>Course:Computer Science And Engineering 
                                        <br>Semester:2
                                        <br>Email: rahul@gmail.com
                                    </address>
                                            </div>
                                           
                                        </div>
                                        <!-- /.row -->
                                        <div class="x_title">
                                           </div>
                                        <!-- Table row -->
										
                                        <div class="row">
                          <div class="col-md-12 col-sm-12 col-xs-12">
                          
                               
                                <div class="x_content">

                                    <table class="table table-striped">
                                        <thead>
                                            <tr class="default">
                                                <th>#</th>
                                                <th>Fees</th>
                                                <th>Amount</th>
                                                
												
                                            </tr>
                                        </thead>
                                        <tbody>
										
                                            <tr class="success">
                                                <th scope="row">1</th>
                                                <td>Tution Fee</td>
                                                <td>2000</td>
                                                
											</tr>
                                            <tr class="danger">
                                                <th scope="row">2</th>
                                                <td>Id Card Fee</td>
                                                <td>100</td>
                                              
											</tr>
                                            <tr class="info">
                                                <th scope="row">3</th>
                                                <td>Books Fee</td>
                                                <td>1000</td>
                                             
											 </tr>
                                        </tbody>
                                    </table>

                               
                            </div>
							</div>
                                        <!-- /.row -->

                                        <div class="row">
                                            <!-- accepted payments column -->
                                            <div class="col-xs-8" style="padding-right:50px; height:160px ;border-right: 2px dotted #ccc;">
											
                                              <u> <p class="lead">Previous Fees Balance :</p></u>
											<div class="table-responsive">
                                                    <table class="table">
                                                        <tbody>
                                                            <tr class="danger">
                                                                <th style="width:50%">Subtotal:</th>
                                                                <td>300</td>
                                                            </tr>
                                                            <tr class="info">
                                                                <th>Penalty:</th>
                                                                <td>10</td>
                                                            </tr>
															<tr class="success">
                                                                <th>Total:</th>
                                                                <td>310</td>
                                                            </tr>
                                                          
                                                        </tbody>
                                                    </table>
                                                </div>
                                                
                                            </div>
                                            <!-- /.col -->
                                            <div class="col-xs-4" >
                                                
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <tbody>
                                                            <tr class="danger">
                                                                <th style="width:50%">Subtotal:</th>
                                                                <td>3100</td>
                                                            </tr>
                                                            <tr class="success">
                                                                <th>Previous Balance:</th>
                                                                <td>310</td>
                                                            </tr>
                                                            <tr class="warning">
                                                                <th>Total:</th>
                                                                <td>3410 KSH</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <!-- /.col -->
                                        </div>
                                        <!-- /.row -->
										
									              <div class="x_title">
													  </div>
										<div class="row invoice-info">
                                            <div class="col-sm-12 invoice-col">
											<div class="x_content">
										<u> <p class="lead"> Payment Conditions:</p></u>

										
											<ul>
											<li>Payments are to be made to the Company without any deduction or discount other than as
stated in these Terms or in the relevant invoice or statement.</li>
                                            <li> A deposit of 35% of the invoice price must be paid when placing an order.</li>
                                             <li>Where Goods are ordered with fabric selected by the Customer, the fabric must be paid for
in full at the time the deposit is paid.</li>
                                          <li> The balance of the invoice price must be paid in full before delivery.</li>
                                           <li> Interest is payable on all overdue accounts calculated on a daily basis at the rate of 1.5% per
month as from the date due for payment until payment is received by the Company.</li>
                                            <ul> 
											                                                    									
											</div>
											</div>
											</div>
                                        <!-- this row will not appear when printing -->
                                         <div class="ln_solid"></div>
                                        <div class="row no-print">
                                            <div class="col-xs-12">
                                                <button class="btn btn-info" onclick="window.print();"><i class="fa fa-print"></i> Print</button>
                                                <button class="btn btn-success pull-right"><i class="fa fa-file-excel-o"></i> Generate Excel</button>
                                                <button class="btn btn-primary pull-right" style="margin-right: 5px;"><i class="fa fa-file-pdf-o"></i> Generate PDF</button>
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

</body>

</html>
 <%}
	else{
		response.sendRedirect("dashboard.jsp");	
	 }
}%>
 