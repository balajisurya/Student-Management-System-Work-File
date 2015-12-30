<%@ page errorPage="error.jsp" %>
<% if(session.getAttribute("authenticated")!=null && session.getAttribute("authenticated").equals("true")){
	response.sendRedirect("dashboard.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- font icon -->
    <link href="css/elegant-icons-style.css" rel="stylesheet" />
     <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom styles -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/mycustom/loginform.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <!-- Custom styling plus plugins -->
    <link href="css/custom.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
   <script type="text/javascript">
   
$(document).ready(function(){
$("#login_frm").submit(function(){
 
//remove previous class and add new "myinfo" class
$("#msgbox").removeClass().addClass('validating').text('Validating Your Login ').fadeIn(500);
 
this.timer = setTimeout(function () {
$.ajax({
url: 'logincheck.jsp',
data: 'user-name='+ $('#login_id').val() +'&pass-word=' + $('#password').val(),
type: 'post',
success: function(msg){
if(msg!='Failed') // Message Sent, check and redirect
{                // and direct to the success page
 $("#msgbox").html('Login Verified, Logging in.....').addClass('myinfo').fadeTo(900,1,function(){
		document.location='dashboard.jsp';
	});
}
else{
	$("#msgbox").fadeTo(200,0.1,function() //start fading the messagebox
			{
			//add message and change the class of the box and start fading
			$(this).html('Invalid Username or Password').removeClass().addClass('myerror').fadeTo(900,1);
			});
}
}
 
});
}, 1500);
return false;
});
 
});
 
</script>

</head>
  <body class="login-img3-body">
    <div class="container">
      <form class="login-form" id="login_frm" action="" method="post">        
        <div class="login-wrap">
            <p class="login-img"><i class="icon_lock_alt"></i></p>
            <div class="input-group">
              <span class="input-group-addon"><i class="icon_profile"></i></span>
              <input type="text" id="login_id" class="form-control" placeholder="Username" autofocus name="user-name">
            </div>
            <div class="input-group">
                <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                <input type="password" id="password" class="form-control" placeholder="Password" name="pass-word">
            </div>
            <button class="btn btn-success btn-lg btn-block" type="submit">Login</button>
            <button type="button" class="btn btn-info btn-lg btn-block" data-toggle="modal" data-target=".bs-example-modal-sm" data-backdrop="static" data-keyboard="false">Forgot Password</button>
             <div id="msgbox"></div>
            </div>
            </form>
    
                          
                          <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-sm">
                                        <div class="modal-content">

                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                                                </button>
                                                <h4 class="modal-title" id="myModalLabel2">Password Recovery</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form>
                                                  <div class="form-group">
                                                     
                                                      <input type="email" class="form-control sm-input" id="" placeholder="Enter Email">
                                                  </div>
                                                 
                                              
                                          
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-primary">Reset Password</button>
                                            </div>
                                            </form>
                                            </div>

                                        </div>
                                    </div>
                                </div>
        </div>
     
    
    
    <script src="js/bootstrap.min.js"></script>

    
    
   
    

    

   
  </body>
</html>
