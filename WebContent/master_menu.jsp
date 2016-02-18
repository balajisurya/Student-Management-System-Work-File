
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="in.jdsoft.studentmanagement.controller.MenuController"%>
<%@page import="java.util.List"%>
<%@page import="in.jdsoft.studentmanagement.model.Menu"%>

            <div class="col-md-3 left_col">
                <div class="left_col scroll-view">

                    <div class="navbar nav_title" style="border: 0;">
                        <a href="index.html" class="site_title"><img style="max-width:150px;max-height:100px;margin-left: 5px"
             src="images/jdlogo.png"></img></a>
                    </div>
                    <div class="clearfix"></div>


                    <!-- menu prile quick info -->
                    <div class="profile">
                        <div class="profile_pic">
                            <img src="images/img.jpg" alt="..." class="img-circle profile_img">
                        </div>
                        <div class="profile_info">
                            <span>Welcome,</span>
                            <h2><% out.print(session.getAttribute("name")); %></h2>
                        </div>
                    </div>
                    <!-- /menu prile quick info -->

                    <br />

                    <!-- sidebar menu -->
                    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">

                        <div class="menu_section">
                            <h3><% out.print(session.getAttribute("type")); %></h3>
                            <ul class="nav side-menu">
                            <%
    								String type="#".concat(session.getAttribute("type").toString());
    								MenuController menucontroller = new MenuController();
    								List<Menu> menu = menucontroller.getMenuList(type);
    								int count=0;
    								for(Menu m:menu){ 
    									int submenusize=menucontroller.getSubMenuList(m.getMenuId(),type).size();
    									
   							 %>
   							 </ul>
                            <ul class="nav side-menu">
                                <li><a href=<% out.println(m.getMenuLink());%>><i class="<%out.print(m.getMenuIcon());%>"></i> <% out.println(m.getMenuName()); %><span class="<%if(submenusize!=0){out.print("fa fa-chevron-down");}%>"></span></a>
                                <%
    									if(submenusize!=0){		   
    									List<Menu> submenu = menucontroller.getSubMenuList(m.getMenuId(), type);
    	    							for(Menu sm:submenu){
    	  						%>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href=<% out.println(sm.getSubMenuLink());%>><% out.println(sm.getSubMenuName()); %></a>
                                        </li>
                                    </ul>
                                    
                                    
                                    <%
    	  								   }
    	 								}
    								%>
                                </li>
                            </ul>
                            <%}
  							%>
                            
                      <!-- /sidebar menu -->
                </div>
                </div>
                </div>
            </div>
            
            
        

