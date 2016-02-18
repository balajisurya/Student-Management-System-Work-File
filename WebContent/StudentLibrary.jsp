<%@page import="in.jdsoft.studentmanagement.model.UserManagement"%>
<%@page import="in.jdsoft.studentmanagement.controller.UserManagementController"%>
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

    <title>StudentLibrary</title>

    <!-- Bootstrap core CSS -->

    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">

    <!-- Custom styling plus plugins -->
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/icheck/flat/green.css" rel="stylesheet">
    <link href="css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
    <script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
<script type = "text/javascript">
         $(document).ready(function() {
        	 $("#tr").click(function(){
        		 
        		 
        		   $('#demo').validate({
        				   submitHandler: function(form) {
        			      
        			          

        	        			$('#usermanagement').modal('show');
        			        
        			            return true;     
        			        }
        			    });	   
        		   
        		  
        	  
         });
         });
      </script>
    

</head>

<body class="nav-md">
    <div class="container body">
    <div class="main_container" >
        <%@ include file="master_menu.jsp" %>
   		<%@ include file="master_header.jsp" %>
<div class="right_col" role="main">
  <div class="">
                   
        <div class="clearfix"></div>

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Library</h2>
                                
                                    
                                    <div class="clearfix"></div>
                                </div>

                                <div class="x_content">

                                   <div class="table-responsive">

                                    <table class="table table-striped responsive-utilities jambo_table bulk_action">
                                        <thead>
                                            <tr class="headings">
                                                <th class="column-title">Serial No</th>
                                                <th class="column-title">Student ID </th>
                                                 <th class="column-title">Book ID</th>
                                                <th class="column-title">Issue Date </th>
                                                <th class="column-title">Due Date</th>
                                                <th class="column-title">Return Date</th>
                                                <th class="column-title">Penalty Fees</th>
                                               
                                               
                                </tr>
                            </thead>

                            <tbody>
                                <tr class="even pointer">
                                    
                                    <td class=" ">121000040</td>
                                    <td class=" ">#135451</td>
                                    <td class=" ">121000210 </td>
                                    <td class=" ">May 23, 2014 11:47:56 PM </td>
                                    <td class=" ">May 23, 2014 11:47:56 PM </td>
                                    <td class=" ">160</td>
                                     <td class=" ">121000039</td>
                                   
                                                  
                                            </tr>
                                            <tr class="odd pointer">
                                              
                                                <td class=" ">121000039</td>
                                                <td class=" ">#135451</td>
                                                <td class=" ">121000208 
                                                </td>
                                                <td class=" ">May 23, 2014 11:47:56 PM </td>
                                                <td class=" ">May 23, 2014 11:47:56 PM </td>
                                                <td class=" ">160</td>
                                               <td class=" ">121000039</td>
                                            </tr>
                                            <tr class="even pointer">
                                                
                                                <td class=" ">121000038</td>
                                                <td class=" ">#135451</td>
                                                <td class=" ">121000203 
                                                </td>
                                                <td class=" ">May 23, 2014 11:47:56 PM </td>
                                                <td class=" ">May 23, 2014 11:47:56 PM </td>
                                                 <td class=" ">160</td>
                                                  <td class=" ">121000039</td>
                                            </tr>
                                            <tr class="odd pointer">
                                                
                                                <td class=" ">121000037</td>
                                                <td class=" ">#135451</td>
                                                <td class=" ">121000204</td>
                                               <td class=" ">May 23, 2014 11:47:56 PM </td>
                                               <td class=" ">May 23, 2014 11:47:56 PM </td>
                                                <td class=" ">160</td>
                                                 <td class=" ">121000039</td>
                                            </tr>
                                            <tr class="even pointer">
                                                
                                                <td class=" ">121000040</td>
                                               <td class=" ">#135451</td>
                                                <td class=" ">121000210</td>
                                              <td class=" ">May 23, 2014 11:47:56 PM </td>
                                              <td class=" ">May 23, 2014 11:47:56 PM </td>
                                               <td class=" ">160</td>
                                                <td class=" ">121000039</td>
                                             </tr>
                                            <tr class="odd pointer">
                                                
                                                <td class=" ">121000039</td>
                                             <td class=" ">#135451</td>
                                                <td class=" ">121000208 
                                                </td>
                                               <td class=" ">May 23, 2014 11:47:56 PM </td>
                                               <td class=" ">May 23, 2014 11:47:56 PM </td>
                                               <td class=" ">160</td>
                                                <td class=" ">121000039</td>
                                            </tr>
                                            <tr class="even pointer">
                                               
                                                <td class=" ">121000038</td>
                                            <td class=" ">#135451</td>
                                                <td class=" ">121000203</td>
                                                <td class=" ">May 23, 2014 11:47:56 PM </td>
                                                <td class=" ">May 23, 2014 11:47:56 PM </td>
                                                  <td class=" ">160</td>
                                                   <td class=" ">121000039</td>
                                            </tr>
                                            <tr class="odd pointer">
                                                
                                                <td class=" ">121000037</td>
                                               <td class=" ">#135451</td>
                                                <td class=" ">121000204</td>
                                                 <td class=" ">May 23, 2014 11:47:56 PM </td>
                                                 <td class=" ">May 23, 2014 11:47:56 PM </td>
                                                <td class=" ">160</td>
                                                 <td class=" ">121000039</td>
                                            </tr>

                                            <tr class="even pointer">
                                               
                                                <td class=" ">121000040</td>
                                                <td class=" ">#135451</td>
                                                <td class=" ">121000210</td>
                                                 <td class=" ">May 23, 2014 11:47:56 PM </td>
                                                 <td class=" ">May 23, 2014 11:47:56 PM </td>
                                                 <td class=" ">160</td>
                                                  <td class=" ">121000039</td>
                                            </tr>
                                            <tr class="odd pointer">
                                                
                                                <td class=" ">121000039</td>
                                                 <td class=" ">#135451</td>
                                                <td class=" ">121000208</td>
                                                <td class=" ">May 23, 2014 11:47:56 PM </td>
                                                <td class=" ">May 23, 2014 11:47:56 PM </td>
                                                <td class=" ">160</td>
                                                 <td class=" ">121000039</td>
                                           
                                            </tr>
                                            </tbody>

                                    </table>
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
        <!-- formHide jquery -->
  		  <script type="text/javascript" src="js/formHide.js"></script>
 	    <!-- /formHide jquery -->

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
        
     
         <!-- PNotify -->
    <script type="text/javascript" src="js/notify/pnotify.core.js"></script>
    <script type="text/javascript" src="js/notify/pnotify.buttons.js"></script>
    <script type="text/javascript" src="js/notify/pnotify.nonblock.js"></script>
     
            

</body>
</html>
 <%}%>