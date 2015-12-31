<!DOCTYPE html>
<%@page import="in.jdsoft.studentmanagement.model.FeesTemplate"%>
<%@page import="in.jdsoft.studentmanagement.controller.FeesTemplateController"%>
<%@page import="in.jdsoft.studentmanagement.model.CourseCategory"%>
<%@page import="in.jdsoft.studentmanagement.controller.CourseCategoryController"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.jdsoft.studentmanagement.controller.CourseController"%>
<%@page import="in.jdsoft.studentmanagement.model.Courses"%>
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
    <title>Registration </title>

    <!-- Bootstrap core CSS -->

    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">

    <!-- Custom styling plus plugins -->
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/icheck/flat/green.css" rel="stylesheet">
    <!-- editor -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
    <link href="css/editor/external/google-code-prettify/prettify.css" rel="stylesheet">
    <link href="css/editor/index.css" rel="stylesheet">
    <!-- select2 -->
    <link href="css/select/select2.min.css" rel="stylesheet">
    <!-- switchery -->
    <link rel="stylesheet" href="css/switchery/switchery.min.css" />

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
    
    <!-- Custom styling plus plugins -->
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/icheck/flat/green.css" rel="stylesheet">
    <!-- ion_range -->
    <link rel="stylesheet" href="css/normalize.css" />
    <link rel="stylesheet" href="css/ion.rangeSlider.css" />
    <link rel="stylesheet" href="css/ion.rangeSlider.skinFlat.css" />

    <!-- colorpicker -->
    <link href="css/colorpicker/bootstrap-colorpicker.min.css" rel="stylesheet">
    <script type = "text/javascript">
         $(document).ready(function() {
        	 $("#tr").click(function(event){
        			
        	     
        		   	$('#test').modal('show');
        	   
        	          
        	    });
         });
      </script>
    <script>
$(document).ready(function() {
$('#courses-list').change(function(event) {
        var courseid = $("select#courses-list").val();
        $.get('StudentRegistartionServlet', {
                courseId : courseid
        }, function(response) {
        var select = $('#semester-joined');
        select.find('option').remove();
        
          $.each(response, function(index, value) {
        	    $('<option>').val(value).text(value).appendTo(select);
        	  
      });
        });
        });
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
                    <form id="demo-form2" action="${pageContext.request.contextPath}/StudentRegistartionServlet" method="post" data-parsley-validate class="form-horizontal form-label-left">
           <div class="col-md-6 col-xs-12">
                         <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">First Name <span class="required">*</span>
                             </label>
                              <div class="col-md-9 col-sm-9 col-xs-12">
                                  <input type="text" id="first-name" name="first-name" required="required" class="form-control col-md-7 col-xs-12">
                              </div>
                         </div>
                         
                          <div class="form-group">
                              <label class="control-label col-md-3 col-sm-3 col-xs-12">Last Name <span class="required">*</span>
                               </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                  <input type="text" id="last-name" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
                                 </div>
                          </div>
                          
                          <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Guardian-First Name <span class="required">*</span>
                                 </label>
                                 <div class="col-md-9 col-sm-9 col-xs-12">
                                       <input type="text" id="guardianfirst-name" name="guardianfirst-name" required="required" class="form-control col-md-7 col-xs-12">
                                 </div>
                          </div>
                          
                           <div class="form-group">
                                  <label class="control-label col-md-3 col-sm-3 col-xs-12">Guardian-Last Name <span class="required">*</span>
                                   </label>
                                   <div class="col-md-9 col-sm-9 col-xs-12">
                                       <input type="text" id="guardianlast-name" name="guardianlast-name" required="required" class="form-control col-md-7 col-xs-12">
                                   </div>
                            </div>
                            
                            <div class="form-group">
                                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Gender <span class="required">*</span></label>
                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                     <div class="radio">
                                         <select class="form-control" id="sex" name="sex" required="required">
                                        <option value="" disabled selected>Select Sex</option>
                                             
                                                 		<option >Male</option>
                                                 		<option >Female</option>
                                             	
                                          </select>
                                      </div>
                                    </div>
                            </div>
                                   <div class="form-group">
                                         <label class="control-label col-md-3 col-sm-3 col-xs-12">Date Of Birth <span class="required">*</span>
                                          </label>
                                           <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input id="birthday"  data-inputmask="'mask': '99/99/9999'" name="student_dob" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text">
                                              
                                           </div>
                                   </div>
                             <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="student_email">Email ID <span class="required">*</span>
                                        </label>
                                           <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="email" id="student_email" name="student_email" required="required" class="form-control col-md-7 col-xs-12">
                                           </div>
                                 </div>
                                 
                                  <div class="form-group">
                                         <label class="control-label col-md-3 col-sm-3 col-xs-12" for="contact_number">Contact Number <span class="required">*</span>
                                         </label>
                                         <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="text" id="contact_number" name="contact_number" required="required" class="form-control col-md-7 col-xs-12">
                                         </div>
                                  </div>
                                  
                                  
                                 
                                   
                                
            					  
                                   
                                   
                            
                                       
                                <div class="form-group">
                                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="image_path">Student Photo <span class="required">*</span>
                                       </label>
                                       <div class="col-md-55">
                                            <div class="thumbnail" style="height: 100%; width:180%">
                                                <div class="image view view-first" style="height: 100%; width:100%">
                                                    <img id="thumbnil" style="width:100%;  display: block;" src="images/user.png" alt="image" />
                                                    <div class="mask">
                                                    	<input name="photo" type="file" class="btn-primary" style="display:block;" accept="image/*" onchange="showMyImage(this)"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                                
                                </div>
                                 <div class="col-md-6 col-xs-12">  
                                       <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address_line_1">Address Line 1 <span class="required">*</span>
                                            </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                            
                                                <input type="text" id="address_line1" name="address_line_1" required="required" class="form-control col-md-7 col-xs-12">

                                                
                                            </div>
                                    </div>
                                    
                                    <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address_line_2">Address Line 2 <span class="required">*</span>
                                            </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                 <input type="text" id="address_line2" name="address_line_2" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                    </div>
                                    <div class="form-group">
                               			<label class="control-label col-md-3 col-sm-3 col-xs-12">Country <span class="required">*</span></label>
                                			<div class="col-md-9 col-sm-9 col-xs-12">
                                				<select class="form-control" id="countryd" name="country" required="required">
                                					<option value="1" disabled selected>Select Country</option>
                                   	  				<option value="2">Kenya</option>
                                   	  				<option value="3">Srilanka</option>
                                   	  				<option value="4">India</option>
                                 				</select>
                                 			</div>
                                    </div>
                                     <div class="form-group">
                               			<label class="control-label col-md-3 col-sm-3 col-xs-12">City <span class="required">*</span></label>
                                			<div class="col-md-9 col-sm-9 col-xs-12">
                                				<select class="form-control" id="city" name="city" required="required">
                                					<option value="1" disabled selected>Select City</option>
                                   	  				<option value="2">Nairobi</option>
                                   	  				<option value="3">Colombo</option>
                                   	  				<option value="4">Delhi</option>
                                 				</select>
                                 			</div>
                                    </div>
                                        
                                        <div class="form-group">
                                           <label class="control-label col-md-3 col-sm-3 col-xs-12" for="post_code">Post Code <span class="required">*</span>
                                            </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="text" id="post_code" name="post_code" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                       </div>
                                   
                                    <div class="form-group">
                                           <label class="control-label col-md-3 col-sm-3 col-xs-12" for="passport-number">Passport Number <span class="required">*</span>
                                           </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="text" id="passport-number" name="passport-number" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                     </div>
                            
                                <div class="form-group">
                                         <label class="control-label col-md-3 col-sm-3 col-xs-12">Date Of Admission <span class="required">*</span>
                                          </label>
                                           <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input name="date_of_joining"  data-inputmask="'mask': '99/99/9999'" id="date_of_joining" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text">
                                           </div>
                                   </div>
                       <div class="form-group">
                                  <label class="control-label col-md-3 col-sm-3 col-xs-12">Category <span class="required">*</span></label>
                                     <div class="col-md-9 col-sm-9 col-xs-12">
                                         <select class="form-control" name="category" required="required">
                                         <option value="" disabled selected>Select Category</option>
                                              <%
                                              		CourseCategoryController courseCategoryController=new CourseCategoryController();
                                             		ArrayList<CourseCategory> categories =courseCategoryController.getCategoryList();
                                              		if(categories.size()>0){
                                            			for(CourseCategory category:categories){  
                                              			%>
                                                 			<option value="<%out.print(category.getCategoryId()); %>"><%out.print(category.getCategoryName()); %></option>
                                              			<%}
                                            		}
                                              %>
                                          </select>
                                      </div>
                                </div>
               
                                 <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Course Name <span class="required">*</span></label>
                                     <div class="col-md-9 col-sm-9 col-xs-12">
                                        <select class="form-control" id="courses-list" name="courses-list" required="required">
                                        <option value="" disabled selected>select joining course </option>
                                             <%
                                               	CourseController courseController=new CourseController();
                                              	ArrayList<Courses> courses=courseController.viewCourse();
                                              	if(courses.size()>0){
                                            		for(Courses course:courses){  
                                             		%>
                                                 		<option value="<%out.print(course.getCourseId()); %>"><%out.print(course.getCourseName()); %></option>
                                             		<%}
                                            	}%>
                                          </select>
                                      </div>
                             </div>
                                        
                            <div class="form-group">
                               <label class="control-label col-md-3 col-sm-3 col-xs-12">Semester <span class="required">*</span></label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                	<select class="form-control" id="semester-joined" name="semester-joined" required="required">
                                	<option value="" disabled selected>Select Course First </option>
                                   	</select>
                                 </div>
                             </div>
                                        
                             
                                     
                                     <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Fees Structure <span class="required">*</span></label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <select class="form-control" name="feesTemplateId" required="required">
                                                <option value="" disabled selected>Select Fees Structure </option>
                                                 <%FeesTemplateController feesTemplateController=new FeesTemplateController();
                                                   ArrayList<FeesTemplate> feesTemplates= feesTemplateController.viewTemplates();
                                                   for(FeesTemplate feesTemplate:feesTemplates){%>
                                                   <option value="<%out.print(feesTemplate.getTemplateId());%>"><%out.print(feesTemplate.getTemplateName()); %></option>
                                                   <%
                                                   }%>
                                                </select>
                                            </div>
                                      </div>
                                      
                                      <div class="ln_solid"></div>
                                     <div class="form-group">
                                             <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                <a href="course.jsp" class="btn btn-primary" role="button"  >Cancel</a>
                                                 <button type="reset" class="btn btn-info">Clear</button>
                                                 <button type="button" class="btn btn-success" data-toggle="modal" data-target=".bs-example-modal-lg" id="tr">Register</button>
                                             </div>
                                        </div>
                                        
                                      
                                        
                                </div>       
    						
    							
                                        
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
  
  
        
    
    <!-- icheck -->
    <script src="js/icheck/icheck.min.js"></script>
    <script src="js/custom.js"></script>
    <!-- input mask -->
    <script src="js/input_mask/jquery.inputmask.js"></script>
         
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-1.11.3.js" type="text/javascript"></script>
        <!-- chart js -->
        <script src="js/chartjs/chart.min.js"></script>
        <!-- bootstrap progress js -->
        <script src="js/progressbar/bootstrap-progressbar.min.js"></script>
        <script src="js/nicescroll/jquery.nicescroll.min.js"></script>
        <!-- icheck -->
        <script src="js/icheck/icheck.min.js"></script>
        <!-- tags -->
        <script src="js/tags/jquery.tagsinput.min.js"></script>
        <!-- switchery -->
        <script src="js/switchery/switchery.min.js"></script>
        <!-- daterangepicker -->
        <script type="text/javascript" src="js/moment.min2.js"></script>
        <script type="text/javascript" src="js/datepicker/daterangepicker.js"></script>
        <!-- richtext editor -->
        <script src="js/editor/bootstrap-wysiwyg.js"></script>
        <script src="js/editor/external/jquery.hotkeys.js"></script>
        <script src="js/editor/external/google-code-prettify/prettify.js"></script>
        <!-- select2 -->
        <script src="js/select/select2.full.js"></script>
        <script src="js/profile_pic.js"></script>
        <!-- form validation -->
        <script type="text/javascript" src="js/parsley/parsley.min.js"></script>
        <!-- textarea resize -->
        <script src="js/textarea/autosize.min.js"></script>
        <script>
            autosize($('.resizable_textarea'));
        </script>
        <!-- Autocomplete -->
        <script type="text/javascript" src="js/autocomplete/countries.js"></script>
        <script src="js/autocomplete/jquery.autocomplete.js"></script>
        
        <script>
        $(document).ready(function () {
            $(":input").inputmask();
        });
    </script>
    
        <script type="text/javascript">
            $(function () {
                'use strict';
                var countriesArray = $.map(countries, function (value, key) {
                    return {
                        value: value,
                        data: key
                    };
                });
                // Initialize autocomplete with custom appendTo:
                $('#autocomplete-custom-append').autocomplete({
                    lookup: countriesArray,
                    appendTo: '#autocomplete-container'
                });
            });
        </script>
        <script src="js/custom.js"></script>


   				<script type="text/javascript">
                        $(document).ready(function () {
                            $('#birthday').daterangepicker({
                                singleDatePicker: true,
                                calender_style: "picker_3"
                            }, function (start, end, label) {
                                console.log(start.toISOString(), end.toISOString(), label);
                            });
                        });
                    </script>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('#date_of_joining').daterangepicker({
                                singleDatePicker: true,
                                calender_style: "picker_3"
                            }, function (start, end, label) {
                                console.log(start.toISOString(), end.toISOString(), label);
                            });
                        });
                    </script>

        <!-- select2 -->
        <script>
            $(document).ready(function () {
                $(".select2_single").select2({
                    placeholder: "Select a state",
                    allowClear: true
                });
                $(".select2_group").select2({});
                $(".select2_multiple").select2({
                    maximumSelectionLength: 4,
                    placeholder: "With Max Selection limit 4",
                    allowClear: true
                });
            });
        </script>
        <!-- /select2 -->
        <!-- input tags -->
        <script>
            function onAddTag(tag) {
                alert("Added a tag: " + tag);
            }

            function onRemoveTag(tag) {
                alert("Removed a tag: " + tag);
            }

            function onChangeTag(input, tag) {
                alert("Changed a tag: " + tag);
            }

            $(function () {
                $('#tags_1').tagsInput({
                    width: 'auto'
                });
            });
        </script>
        <!-- /input tags -->
        <!-- form validation -->
        <script type="text/javascript">
            $(document).ready(function () {
                $.listen('parsley:field:validate', function () {
                    validateFront();
                });
                $('#demo-form .btn').on('click', function () {
                    $('#demo-form').parsley().validate();
                    validateFront();
                });
                var validateFront = function () {
                    if (true === $('#demo-form').parsley().isValid()) {
                        $('.bs-callout-info').removeClass('hidden');
                        $('.bs-callout-warning').addClass('hidden');
                    } else {
                        $('.bs-callout-info').addClass('hidden');
                        $('.bs-callout-warning').removeClass('hidden');
                    }
                };
            });

            $(document).ready(function () {
                $.listen('parsley:field:validate', function () {
                    validateFront();
                });
                $('#demo-form2 .btn').on('click', function () {
                    $('#demo-form2').parsley().validate();
                    validateFront();
                });
                var validateFront = function () {
                    if (true === $('#demo-form2').parsley().isValid()) {
                        $('.bs-callout-info').removeClass('hidden');
                        $('.bs-callout-warning').addClass('hidden');
                    } else {
                        $('.bs-callout-info').addClass('hidden');
                        $('.bs-callout-warning').removeClass('hidden');
                    }
                };
            });
            try {
                hljs.initHighlightingOnLoad();
            } catch (err) {}
        </script>
        <!-- /form validation -->
        <!-- editor -->
        <script>
            $(document).ready(function () {
                $('.xcxc').click(function () {
                    $('#descr').val($('#editor').html());
                });
            });

            $(function () {
                function initToolbarBootstrapBindings() {
                    var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier',
                'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
                'Times New Roman', 'Verdana'],
                        fontTarget = $('[title=Font]').siblings('.dropdown-menu');
                    $.each(fonts, function (idx, fontName) {
                        fontTarget.append($('<li><a data-edit="fontName ' + fontName + '" style="font-family:\'' + fontName + '\'">' + fontName + '</a></li>'));
                    });
                    $('a[title]').tooltip({
                        container: 'body'
                    });
                    $('.dropdown-menu input').click(function () {
                            return false;
                        })
                        .change(function () {
                            $(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');
                        })
                        .keydown('esc', function () {
                            this.value = '';
                            $(this).change();
                        });

                    $('[data-role=magic-overlay]').each(function () {
                        var overlay = $(this),
                            target = $(overlay.data('target'));
                        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
                    });
                    if ("onwebkitspeechchange" in document.createElement("input")) {
                        var editorOffset = $('#editor').offset();
                        $('#voiceBtn').css('position', 'absolute').offset({
                            top: editorOffset.top,
                            left: editorOffset.left + $('#editor').innerWidth() - 35
                        });
                    } else {
                        $('#voiceBtn').hide();
                    }
                };

                function showErrorAlert(reason, detail) {
                    var msg = '';
                    if (reason === 'unsupported-file-type') {
                        msg = "Unsupported format " + detail;
                    } else {
                        console.log("error uploading file", reason, detail);
                    }
                    $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>' +
                        '<strong>File upload error</strong> ' + msg + ' </div>').prependTo('#alerts');
                };
                initToolbarBootstrapBindings();
                $('#editor').wysiwyg({
                    fileUploadError: showErrorAlert
                });
                window.prettyPrint && prettyPrint();
            });
        </script>
        <script src="js/bootstrap.min.js"></script>

    <!-- chart js -->
    <script src="js/chartjs/chart.min.js"></script>
    <!-- bootstrap progress js -->
    <script src="js/progressbar/bootstrap-progressbar.min.js"></script>
    <script src="js/nicescroll/jquery.nicescroll.min.js"></script>
    <!-- icheck -->
    <script src="js/icheck/icheck.min.js"></script>
    <script src="js/custom.js"></script>
    <!-- daterangepicker -->
    <script type="text/javascript" src="js/moment.min2.js"></script>
    <script type="text/javascript" src="js/datepicker/daterangepicker.js"></script>
    <!-- input mask -->
    <script src="js/input_mask/jquery.inputmask.js"></script>
    <!-- knob -->
    <script src="js/knob/jquery.knob.min.js"></script>
    <!-- range slider -->
    <script src="js/ion_range/ion.rangeSlider.min.js"></script>
    <!-- color picker -->
    <script src="js/colorpicker/bootstrap-colorpicker.js"></script>
    <script src="js/colorpicker/docs.js"></script>

   


      <!-- input_mask -->
    <script>
        $(document).ready(function () {
            $(":input").inputmask();
        });
    </script>
    <!-- /input mask -->
    </body>
</html>
<%} %>
