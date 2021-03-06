<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>标签管理系统 - 首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- basic styles -->
    <link href="ACE/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="ACE/css/font-awesome.min.css" />
    <!--[if IE 7]>
		  <link rel="stylesheet" href="ACE/css/font-awesome-ie7.min.css" />
		<![endif]-->
    <!-- page specific plugin styles -->
    <!-- fonts -->
    <!-- ace styles -->
    <link rel="stylesheet" href="ACE/css/ace.min.css" />
    <link rel="stylesheet" href="ACE/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="ACE/css/ace-skins.min.css" />
    <!--[if lte IE 8]>
		  <link rel="stylesheet" href="ACE/css/ace-ie.min.css" />
		<![endif]-->
    <!-- inline styles related to this page -->
    <!-- ace settings handler -->
    <script src="ACE/js/ace-extra.min.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
		<script src="ACE/js/html5shiv.js"></script>
		<script src="ACE/js/respond.min.js"></script>
		<![endif]-->
	<style>
		.page{
			padding: 0;
		}
		.page li{
			float: left;
			padding: 10px;
			list-style: none;
			border:blue,1px,solid;
			font-size:14px;
		}
	</style>
</head>
<body>
    <div class="main-container" id="main-container">
        <div class="main-container-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="icon-home home-icon"></i><a href="welcome.jsp">首页</a> </li>
                    <li><a href="welcome.jsp">项目管理</a> </li>
                    <li class="active">项目列表</li>
                </ul>
                <!-- .bread crumb -->
            </div>
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <form action="" method="get">
                            <div>
                                <input type="text" placeholder="项目名称" class="width-20" name="projectName" value="${param.projectName }" />
                                <input type="text" placeholder="负责人" class="width-20" name="proHead" value="${param.proHead }" />

                                <select class="width-20" name="categoryId">                                
                                    <option value="0" <c:if test="${param.categoryId == 0 }">selected = "selected"</c:if> >项目分类</option>
                                    <option value="1" <c:if test="${param.categoryId == 1 }">selected = "selected"</c:if> >城市设计</option>
                                    <option value="2" <c:if test="${param.categoryId == 2 }">selected = "selected"</c:if> >规划研究</option>
                                    <option value="3" <c:if test="${param.categoryId == 3 }">selected = "selected"</c:if> >专项规划</option>
                                    <option value="4" <c:if test="${param.categoryId == 4 }">selected = "selected"</c:if> >村镇规划</option>
                                    <option value="5" <c:if test="${param.categoryId == 5 }">selected = "selected"</c:if> >景观规划</option>
                                </select>
                                
                                <input type="submit" value="检索" class="btn btn-primary btn-sm" />
								<span style="margin-left:150px;color:orange;font-size:14px;font-weight:bolder;"><em>共${pi.totalPageSize }页，${pi.totalSize }条数据。</em></span>
                            </div>
                            </form>
                            <div class="hr-12"></div>


                            <div>
                                <table class="table table-hover table-bordered">
                                    <thead>
                                        <tr>
                                            <th>项目名称</th>
                                            <th>项目分类</th>
                                            <th>项目属性</th>
                                            <th>操作列</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    	<tr>
                                    		<td colspan="4" style="text-align:center;color:red;padding:0px;margin:0px;font-size:14px;">
                                    			${NoResult }
                                    		</td>
                                    	</tr>                                    
                                    
                                    	<c:forEach items="${pi.result}" var="p">
                                    		<tr>
	                                    		<td><a href="/DetailsProjectServlet?id=${p.id}">${p.projectName}</a></td>
	                                            <td>
	                                                <span class="text-danger">
	                                                	<c:if test="${p.categoryId == 1 }">城市设计</c:if>
	                                                	<c:if test="${p.categoryId == 2 }">规划研究</c:if>
	                                                	<c:if test="${p.categoryId == 3 }">专项规划</c:if>
	                                                	<c:if test="${p.categoryId == 4 }">村镇规划</c:if>
	                                                	<c:if test="${p.categoryId == 5 }">景观规划</c:if>
													</span>&nbsp;&nbsp;
	                                                <span class="text-success">校园</span>
	                                            </td>
	                                            <td>
	                                                <span>${p.proDocNo}</span>
	                                                <span>${p.proArea }</span>
	                                                <span>${p.proHead }</span>
	                                                <span>${p.proArcYear }</span>
	                                            </td>
	                                            <td>
	                                                <a href="/UpdateProjectServlet?id=${p.id}"><i class="icon-edit"></i>修</a>&nbsp;&nbsp;
	                                                <a href="/DeleteProjectServlet?id=${p.id}"><i class="icon-remove"></i>删</a>&nbsp;&nbsp;
	                                                <a href="/DetailsProjectServlet?id=${p.id}" target="_blank"><i class="icon-info"></i>详</a>
	                                            </td>    
                                            </tr>                         	
                                    	</c:forEach>                                   	                                     
                                    </tbody>
                                </table>
                            </div>
                            <div>
                            	<ul class="page">
									<li>
										<c:if test="${pi.currentPage == 1 }">上一页</c:if>
										<c:if test="${pi.currentPage != 1 }">
											<a href="?page=${pi.currentPage - 1}&projectName=${param.projectName}&proHead=${param.proHead}&categoryId=${param.categoryId}">上一页</a>
										</c:if>										
									</li>
									
									<c:forEach begin="1" end="${pi.totalPageSize}" var="tps">
									<li><a href="?page=${tps}&projectName=${param.projectName}&proHead=${param.proHead}&categoryId=${param.categoryId}">${tps}</a></li>
									</c:forEach>
									
									<li>
										<c:if test="${pi.currentPage == pi.totalPageSize }">下一页</c:if>
										<c:if test="${pi.currentPage != pi.totalPageSize }">
											<a href="?page=${pi.currentPage + 1}&projectName=${param.projectName}&proHead=${param.proHead}&categoryId=${param.categoryId}">下一页</a>
										</c:if>									
									</li>
								</ul>
                            </div>
							<div style="clear: both;"></div>
                            <!-- PAGE CONTENT ENDS -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.page-content -->
            </div>
            <!-- /.main-container-inner -->
            <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"><i class="icon-double-angle-up icon-only bigger-110">
            </i></a>
        </div>
        <!-- /.main-container -->
        <script src='ACE/js/jquery-2.0.3.min.js' type="text/javascript"></script>
        <script type="text/javascript">
            if ("ontouchend" in document) document.write("<script src='ACE/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
        </script>
        <script src="ACE/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="ACE/js/typeahead-bs2.min.js" type="text/javascript"></script>
        <script src="ACE/js/ace-elements.min.js" type="text/javascript"></script>
        <script src="ACE/js/ace.min.js" type="text/javascript"></script>
        <script type="text/javascript">
 
        </script>
	</div>
</body>
</html>
