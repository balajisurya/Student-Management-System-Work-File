
  <!-- top navigation -->
            <div class="top_nav">

                <div class="nav_menu">
                    <nav class="" role="navigation">
                        <div class="nav toggle">
                        
                            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                            
                        </div>

                        <ul class="nav navbar-nav navbar-right">
                            <li class="">
                                <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <img src="images/img.jpg" alt=""><% out.print(session.getAttribute("name")); %>
                                    <span class=" fa fa-angle-down"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
                                
                                    <li><a href="editprofile.jsp">Edit Profile</a>
                                    </li>
                                    
                                    <li><a href="logout.jsp"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
                                    </li>
                                     <li><input type="datetime" style="width:inherit;color:green; " value="<%out.print("Last Login :"+session.getAttribute("lastlogin")); %>"/>
                                    </li>
                                </ul>
                            </li>
                             <li class="">
                             
                            
                              <a  href="javascript:;" data-toggle="modal" data-target="#release" ><i class="fa fa-unlock"></i></a>
                             <div class="modal fade" id="release" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                                </button>
               <h4>Confirmation?</h4> 
            </div>
            <div class="modal-body">
                <h5>Are you sure?, You want to release the lock ??</h5>
            </div>
            <div class="modal-footer">
                
                <a href="releaselock.jsp"  class="btn btn-round  btn-success "> Yes</a>
                
            </div>
        </div>
    </div>
</div>
                             
                             </li>
                             
                     </ul>
                    </nav>
                </div>

            </div>