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
    <title>test </title>

    <!-- Bootstrap core CSS -->

    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">  
    <!-- Custom styling plus plugins -->
    <link href="css/custom.css" rel="stylesheet">
  
    <script type = "text/javascript">
    $("#dischargeform").validate({
        rules: {
            firstname: "required",
            lastname: "required",
        },
        messages: {
            firstname: "Please enter your firstname",
            lastname: "Please enter your lastname",
        },
        submitHandler: function (form) {
            $("#myModal").modal('show');
    		$('#SubForm').click(function () {
                form.submit();
           });
        }
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
                    <form class="cmxform" id="dischargeform" method="post">
        <p>
            <label for="firstname">First name</label>
            <input id="firstname" name="firstname" type="text" class="form-control">
        </p>
        <p>
            <label for="lastname">Last name</label>
            <input id="lastname" name="lastname" type="text" class="form-control">
        </p>
        <p>
            <input class="btn btn-primary" type="submit" value="Submit">
        </p>

</form>
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
                </div>

            </div><!--x-panel  -->
        </div><!--/right_col-->
    </div><!--/main_container-->
  </div><!-- /container_body -->
  






        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-1.11.3.js" type="text/javascript"></script>
        <!-- chart js -->
        <script src="js/chartjs/chart.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.14.0/jquery.validate.min.js"></script>
</body>
</html>
<%} %>