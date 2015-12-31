<%@page import="in.jdsoft.studentmanagement.model.Currency"%>
<%@page import="in.jdsoft.studentmanagement.controller.CurrencyController"%>
<%@page import="in.jdsoft.studentmanagement.controller.CourseController"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.jdsoft.studentmanagement.model.TemplateItem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.jdsoft.studentmanagement.controller.TemplateItemController"%>
<%@page errorPage="error.jsp" %>
<%
   if(session.getAttribute("authenticated")!="true"){
    response.sendRedirect("user_login.jsp");
   }
	else{%>
  		
   	<html lang="en">
<head>
   <link href="css/bootstrap.min.css" rel="stylesheet">
   <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
   <link href="css/animate.min.css" rel="stylesheet">
    <!-- Custom styling plus plugins -->
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/icheck/flat/green.css" rel="stylesheet">
    <link href="css/shadow.css" rel="stylesheet">
    <!-- editor -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
    <link href="css/editor/external/google-code-prettify/prettify.css" rel="stylesheet">
    <link href="css/editor/index.css" rel="stylesheet">
    <!-- select2 -->
    <link href="css/select/select2.min.css" rel="stylesheet">
    <title>Fees Items</title>
    <!-- switchery -->
    <link rel="stylesheet" href="css/switchery/switchery.min.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
    <script src="js/mycustom/autosearch.js" ></script>
     <script src="js/mycustom/crud.js" ></script>
</head>
<body class="nav-md">
  <div class="container body">
    <div class="main_container">
    <%@ include file="master_menu.jsp" %>
   		<%@ include file="master_header.jsp" %>
      <div class="right_col" role="main">
        <div id="ListDiv" style="display:block;"> <br>
          <br />
 				<h3>Fees Item</h3>
 				<div class="x_title">
 				  <div class="clearfix">
 				  </div>
 				</div> 
 				  <div class="x_title">
 				  <div class="clearfix">
 				  <button type="button" class="btn btn-primary col-md-2" name="addTemplateItem" onclick="showDiv()"><span class="glyphicon glyphicon-plus-sign" ></span>  Add Fees Item</button>
 				  <button type="button" class="btn btn-success col-md-2" name="importExcel"><span class="glyphicon glyphicon-upload" ></span>  Export Excel</button>
 				  <button type="button" class="btn btn-warning col-md-1" name="print"><span class="glyphicon glyphicon-print" ></span>  Print</button>
 				  <input type="text" class="form-control col-md-2" id="search" placeholder="Fees Item Search " style="width: 200px;margin-left: 400px"/>
 				  </div>
 				</div>
 					<%
 					TemplateItemController feesItemController=new TemplateItemController();
 					ArrayList<TemplateItem> feesItems=feesItemController.viewTemplateItem();
 					CurrencyController currencyController=new CurrencyController();
 					ArrayList<Currency> currencyList=currencyController.viewCurrency();
 					int feesItemCount=feesItems.size();%>
 					<h3>Fees Item[<%out.print(feesItemCount);%>]</h3>
 					
     <div class="row">
          <div class="col-md-12 col-sm-12 col-xs-12">
             <div class="x_panel">
            	 <div  class="table-responsive">
    					<table id="table" class="table table-bordered table-striped">
        					<thead >
            					<tr>
                					<th style="width: auto">S.NO</th>
                					<th style="width: 600px">Fees Item</th>
                					<th style="width: auto">Fee </th>
                					<th style="width: 70px">Action</th>
            					</tr>
        					</thead>
        					<tbody>
               				<%
               					if(feesItemCount>0){
            	   				int SNO=1;
                 				for(TemplateItem feesItem:feesItems){          	 
               				%>
               					<tr>
                					<td><%out.print(SNO);%></td>
                					<td style="width: 120px"><%out.print(feesItem.getTemplateItemName());%></td>
                					<td><%out.print(feesItem.getTemplateItemPrice());%></td>
                					<td style="width: 250px">
                   							<a href="#"  data-href="#" data-id="" class="btn btn-default btn-sm" data-toggle="modal" data-target="#confirm-view">
                           						<span class="glyphicon glyphicon-info-sign"></span> 
                   							</a>
                   							<a href="#"  data-href="#" data-id="" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#confirm-edit">
                           						<span class="glyphicon glyphicon-edit"></span> 
                   							</a>
                   							<a href="#"  data-href="#" data-id="" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#confirm-delete">
                           						<span class="glyphicon glyphicon-trash"></span> 
                   							</a>
                					 </td>
           						 </tr>
                                   <%SNO++;} 
                 			     }
                                 else{%>
                                  <tr>
                					<td colspan="5" align="center">No Courses Available</td>
              					</tr>
          						<% }%>
                              </tbody>
                          </table>
                 <!-- end of for loop -->
                 </div>
              </div>
              
               <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
               <h4>Confirmation?</h4> 
            </div>
            <div class="modal-body">
                <h5>Are you sure?, You want to delete this Fees Item  ??</h5>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-round btn-primary" data-dismiss="modal">Cancel</button>
                <button class="btn btn-round btn-danger" data-dismiss="modal" onclick="new PNotify({
                                title: 'Notification',
                                text: 'successfully deleted',
                                type: 'success'
                            });">Delete</button>
                
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="confirm-edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
               <h4>Edit Fees Item </h4> 
            </div>
            <div class="modal-body">
                 <form class="form-horizontal" role="form">
                  		<div class="form-group">
                    	  <label  class="col-sm-3 control-label" for="courseCode">Fees Item</label>
                    	    <div class="col-sm-9">
                        		<input type="text" class="form-control" id="courseCode" placeholder=""/>
                            </div>
                        </div>
                        <div class="form-group">
                    	  <label  class="col-sm-3 control-label" for="coursename">Amount</label>
                    	    <div class="col-sm-9">
                        		<input type="text" class="form-control" id="coursename" placeholder=""/>
                            </div>
                        </div>
                       
                        <div class="modal-footer">
                        <button type="button" class="btn btn-round btn-primary" data-dismiss="modal">Cancel</button>
                		<button type="submit" class="btn btn-round btn-success" data-dismiss="modal" onclick="new PNotify({
                                title: 'Notify:',
                                text: ' Successfully Updated',
                                type: 'success'
                            });">Update</button>
                      </div>
                 </form>
    
            </div>
            
        </div>
    </div>
</div>
              
              
              
              
          </div>
          </div><!-- end of row -->
          
  </div><!-- end of LisDiv div -->
                                
	<div id="FormDiv" style="display: none;"> 
       <div class="clearfix"></div><!-- end of clearfix div -->
           <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                 <div class="x_panel" style="height:500px;">
                    <div class="x_title">
                               <h2>Fees Template <small>(add new fees template)</small></h2>
                                   <div class="clearfix"></div>
                     </div><!-- end of x_title div -->
                      <div class="x_content">
                                   <br />
                         <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action="${pageContext.request.contextPath}/TemplateItemServlet" method="post">
                             <!-- start of form-group 1 -->
                             <div class="form-group">
                                  <label class="control-label col-md-3 col-sm-3 col-xs-12" for="template-name">Fees Item Name <span class="required">*</span>
                                   </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                         <input name="template-name" type="text" id="template-name" required class="form-control col-md-7 col-xs-12">
                                     </div>
                              </div>
                              <!-- end of form-group 1 -->
                              
                              <!-- start of form-group 2 -->          
                              <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="item-price">Fees Item Price <span class="required">*</span>
                                    </label>
                                      <div class="col-md-6 col-sm-6 col-xs-12">
                                           <input type="text" id="item-price" name="item-price" required class="form-control col-md-7 col-xs-12">
                                      </div>
                              </div>
                              <!-- end of form-group 2 -->
                              
                               
                       <div class="ln_solid"></div>
                           <div class="form-group"><!-- start of form group 5 -->
                           <!-- start of col-md-6 col-sm-6 col-xs-12 col-md-offset-3 -->
                              <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                 <button type="button" class="btn btn-primary" onclick="showDiv()">Cancel</button>
                                    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="false">
                                       <div class="modal-dialog modal-lg">
                                          <div class="modal-content">
					                         <div class="modal-header">
                    					           <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                        	       </button>
                                                   <h4 class="modal-title" id="myModalLabel">Template created Successfully</h4>
                                              </div>
                                          </div>
                                        </div>
                                	 </div>
                                               	<button type="reset" class="btn btn-info">Clear</button>
                                                <button type="submit" class="btn btn-success" name="save" data-toggle="modal" data-target=".bs-example-modal-lg" >Save</button>               
                                </div><!-- end of col-md-6 col-sm-6 col-xs-12 col-md-offset-3 -->
                            </div><!-- end of form group 5 -->
                         </form><!-- end of form -->
                      </div><!-- end of x-content div -->
                 </div><!-- end of x-panel div -->
              </div><!-- end of col-md-12 col-sm-12 col-xs-12 div -->
           </div><!-- end of row div -->
    </div><!-- end of FormDiv div -->
  </div><!-- end of right col -->
 </div><!-- end of main body -->
</div><!-- end of container body -->


<div id="custom_notifications" class="custom-notifications dsp_none">
     <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
     </ul>
     <div class="clearfix"></div>
     <div id="notif-group" class="tabbed_notifications"></div>
</div>

  <script src="js/bootstrap.min.js"></script>
  <!-- gauge js -->
    <script type="text/javascript" src="js/gauge/gauge.min.js"></script>
    <script type="text/javascript" src="js/gauge/gauge_demo.js"></script>
  <!-- chart js -->
    <script src="js/chartjs/chart.min.js"></script>
  <!-- bootstrap progress js -->
    <script src="js/progressbar/bootstrap-progressbar.min.js"></script>
    <script src="js/nicescroll/jquery.nicescroll.min.js"></script>
  <!-- icheck -->
    <script src="js/icheck/icheck.min.js"></script>
  <!-- daterangepicker -->
    <script type="text/javascript" src="js/moment.min.js"></script>
    <script type="text/javascript" src="js/datepicker/daterangepicker.js"></script>
  <!-- custom js -->
    <script src="js/custom.js"></script>
     <!-- formHide jquery -->
  		<script type="text/javascript" src="js/formHide.js"></script>
 	<!-- /formHide jquery -->
  <!-- /custom js -->
  <!-- flot js -->
    <!--[if lte IE 8]><script type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->
    	<script type="text/javascript" src="js/flot/jquery.flot.js"></script>
    	<script type="text/javascript" src="js/flot/jquery.flot.pie.js"></script>
    	<script type="text/javascript" src="js/flot/jquery.flot.orderBars.js"></script>
    	<script type="text/javascript" src="js/flot/jquery.flot.time.min.js"></script>
    	<script type="text/javascript" src="js/flot/date.js"></script>
    	<script type="text/javascript" src="js/flot/jquery.flot.spline.js"></script>
    	<script type="text/javascript" src="js/flot/jquery.flot.stack.js"></script>
    	<script type="text/javascript" src="js/flot/curvedLines.js"></script>
    	<script type="text/javascript" src="js/flot/jquery.flot.resize.js"></script>
    	 <!-- PNotify -->
    <script type="text/javascript" src="js/notify/pnotify.core.js"></script>
    <script type="text/javascript" src="js/notify/pnotify.buttons.js"></script>
    <script type="text/javascript" src="js/notify/pnotify.nonblock.js"></script>
    	<script>
        	$(document).ready(function () {
            	// [17, 74, 6, 39, 20, 85, 7]
            	//[82, 23, 66, 9, 99, 6, 2]
            	var data1 = [[gd(2012, 1, 1), 17], [gd(2012, 1, 2), 74], [gd(2012, 1, 3), 6], [gd(2012, 1, 4), 39], [gd(2012, 1, 5), 20], [gd(2012, 1, 6), 85], [gd(2012, 1, 7), 7]];
				var data2 = [[gd(2012, 1, 1), 82], [gd(2012, 1, 2), 23], [gd(2012, 1, 3), 66], [gd(2012, 1, 4), 9], [gd(2012, 1, 5), 119], [gd(2012, 1, 6), 6], [gd(2012, 1, 7), 9]];
            	$("#canvas_dahs").length && $.plot($("#canvas_dahs"), [
                	data1, data2
            		], {
                	series: {
                    lines: {
                        show: false,
                        fill: true
                    },
                    splines: {
                        show: true,
                        tension: 0.4,
                        lineWidth: 1,
                        fill: 0.4
                    },
                    points: {
                        radius: 0,
                        show: true
                    },
                    shadowSize: 2
                },
                grid: {
                    verticalLines: true,
                    hoverable: true,
                    clickable: true,
                    tickColor: "#d5d5d5",
                    borderWidth: 1,
                    color: '#fff'
                },
                colors: ["rgba(38, 185, 154, 0.38)", "rgba(3, 88, 106, 0.38)"],
                xaxis: {
                    tickColor: "rgba(51, 51, 51, 0.06)",
                    mode: "time",
                    tickSize: [1, "day"],
                    //tickLength: 10,
                    axisLabel: "Date",
                    axisLabelUseCanvas: true,
                    axisLabelFontSizePixels: 12,
                    axisLabelFontFamily: 'Verdana, Arial',
                    axisLabelPadding: 10
                        //mode: "time", timeformat: "%m/%d/%y", minTickSize: [1, "day"]
                },
                yaxis: {
                    ticks: 8,
                    tickColor: "rgba(51, 51, 51, 0.06)",
                },
                tooltip: false
            });

            function gd(year, month, day) {
                return new Date(year, month - 1, day).getTime();
            }
        });
    </script>
   <!-- worldmap -->
    	<script type="text/javascript" src="js/maps/jquery-jvectormap-2.0.1.min.js"></script>
    	<script type="text/javascript" src="js/maps/gdp-data.js"></script>
    	<script type="text/javascript" src="js/maps/jquery-jvectormap-world-mill-en.js"></script>
    	<script type="text/javascript" src="js/maps/jquery-jvectormap-us-aea-en.js"></script>
    	<script>
        	$(function () {
            	$('#world-map-gdp').vectorMap({
                	map: 'world_mill_en',
                	backgroundColor: 'transparent',
                	zoomOnScroll: false,
                	series: {
                    regions: [{
                        values: gdpData,
                        scale: ['#E6F2F0', '#149B7E'],
                        normalizeFunction: 'polynomial'
                    }]
                },
                onRegionTipShow: function (e, el, code) {
                    el.html(el.html() + ' (GDP - ' + gdpData[code] + ')');
                }
            });
        });
    	</script>
    <!-- skycons -->
    	<script src="js/skycons/skycons.js"></script>
    	<script>
        	var icons = new Skycons({
                "color": "#73879C"
            }),
            list = [
                "clear-day", "clear-night", "partly-cloudy-day",
                "partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind",
                "fog"
            ],
            i;

        	for (i = list.length; i--;)
            icons.set(list[i], list[i]);

        	icons.play();
    	</script>
    <!-- dashbord linegraph -->
    	<script>
        	var doughnutData = [
            	{
                value: 30,
                color: "#455C73"
            },
            {
                value: 30,
                color: "#9B59B6"
            },
            {
                value: 60,
                color: "#BDC3C7"
            },
            {
                value: 100,
                color: "#26B99A"
            },
            {
                value: 120,
                color: "#3498DB"
            }
    		];
        	var myDoughnut = new Chart(document.getElementById("canvas1").getContext("2d")).Doughnut(doughnutData);
        </script>
    <!-- /dashbord linegraph -->
    <!-- datepicker -->
    <script type="text/javascript">
        $(document).ready(function () {

            var cb = function (start, end, label) {
                console.log(start.toISOString(), end.toISOString(), label);
                $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
                //alert("Callback has fired: [" + start.format('MMMM D, YYYY') + " to " + end.format('MMMM D, YYYY') + ", label = " + label + "]");
            }

            var optionSet1 = {
                startDate: moment().subtract(29, 'days'),
                endDate: moment(),
                minDate: '01/01/2012',
                maxDate: '12/31/2015',
                dateLimit: {
                    days: 60
                },
                showDropdowns: true,
                showWeekNumbers: true,
                timePicker: false,
                timePickerIncrement: 1,
                timePicker12Hour: true,
                ranges: {
                    'Today': [moment(), moment()],
                    'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                    'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                    'This Month': [moment().startOf('month'), moment().endOf('month')],
                    'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                },
                opens: 'left',
                buttonClasses: ['btn btn-default'],
                applyClass: 'btn-small btn-primary',
                cancelClass: 'btn-small',
                format: 'MM/DD/YYYY',
                separator: ' to ',
                locale: {
                    applyLabel: 'Submit',
                    cancelLabel: 'Clear',
                    fromLabel: 'From',
                    toLabel: 'To',
                    customRangeLabel: 'Custom',
                    daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
                    monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                    firstDay: 1
                }
            };
            $('#reportrange span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
            $('#reportrange').daterangepicker(optionSet1, cb);
            $('#reportrange').on('show.daterangepicker', function () {
                console.log("show event fired");
            });
            $('#reportrange').on('hide.daterangepicker', function () {
                console.log("hide event fired");
            });
            $('#reportrange').on('apply.daterangepicker', function (ev, picker) {
                console.log("apply event fired, start/end dates are " + picker.startDate.format('MMMM D, YYYY') + " to " + picker.endDate.format('MMMM D, YYYY'));
            });
            $('#reportrange').on('cancel.daterangepicker', function (ev, picker) {
                console.log("cancel event fired");
            });
            $('#options1').click(function () {
                $('#reportrange').data('daterangepicker').setOptions(optionSet1, cb);
            });
            $('#options2').click(function () {
                $('#reportrange').data('daterangepicker').setOptions(optionSet2, cb);
            });
            $('#destroy').click(function () {
                $('#reportrange').data('daterangepicker').remove();
            });
        });
  </script>
  <script>
        NProgress.done();
   </script>
   <!-- /datepicker -->
  <!-- /footer content -->
</body>
</html>
 <%}%>
