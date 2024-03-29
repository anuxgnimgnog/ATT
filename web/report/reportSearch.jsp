<%@ page import="java.util.LinkedList" %>
<%@ page import="com.ATT.dao.initializeReport" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css" />
<link href="../css/select.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<link rel="stylesheet" type="text/css" href="../css/WdatePicker.css" />
<link rel="stylesheet" type="text/css" href="../css/skin_/form.css" />
<link href="umeditor/themes/default/_css/umeditor.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="../js/select-ui.min.js"></script>

<script type="text/javascript" src="../js/global.js"></script>
<script type="text/javascript" src="../js/jquery.select.js"></script>
<script type="text/javascript" src="../js/WdatePicker.js"></script>
<script type="text/javascript" src="../js/umeditor.config.js"></script>
<script type="text/javascript" src="../js/editor_api.js"></script>
<script type="text/javascript" src="../umeditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>
    <%
        if (session.getAttribute("reportList")==null){
            LinkedList list = initializeReport.get("ALL","ALL","ALL");
            pageContext.setAttribute("reportList",list);
        }

    %>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">日报管理</a></li>
    </ul>
    </div>
   
	<!--查询条件-->
    <br />
    <br />
    <form action="/ReportPageServlet" method="post">
    <ul class="seachform">
   <li>
      <label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名</label><input  type="text" class="scinput" name = "name" /></li>
    <li>
      <label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;开始日期</label><input  type="text" class="scinput" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name = "startdate"/></li>
    <li>
      <label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结束日期</label><input  type="text" class="scinput" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name = "enddate"/></li>

    <li><label>&nbsp;</label><input name="select" type="submit" class="scbtn" value="查询"/></li>
    
    </ul>
    </form>
    </div>
    <form action="/ReportDelServlet" method="post">
    <div class="tools">

    	<ul class="toolbar">
        <li class="click"><span><img src="../images/t01.png" /></span><a href="/report/reportInsert.jsp" target="_self">添加</a></li>
        <li class="click"><img src="../images/trash.png" /></span><input type="submit" style="outline: none;border: none;background:none;height: 33px;cursor: pointer"  value="删除"></li>
        </ul>
    </div>
    
    
    <table class="tablelist"><tbody><tr><td><table class="tablelist"><tbody><tr><td><table class="tablelist">
      <tbody>
        <tr>
          <td><table class="tablelist">
              <thead>
                <tr>
                <th width="3%"><input name="" type="checkbox" value="" checked="checked"/></th>
                  <th width="7%">工号<i class="sort"><img src="../images/px.gif" /></i></th>
                  <th width="11%">姓名</th>
                  <th width="10%">日期</th>
                  <th width="9%">作业进度</th>
                  <th width="11%">作业内容</th>
                  <th width="7%">问题点</th>
                  <th width="8%">联络事项</th>
                  <th width="13%">操作</th>
                </tr>
              </thead>
              <tbody>
              <tr>
                  <c:forEach items="${reportList}" var="list">
              <tr>
                  <td><input name="check" type="checkbox" value="${list.report_id}"/></td>
                  <td>${list.account}</td>
                  <td>${list.name}</td>
                  <td>${list.report_date}</td>
                  <td>${list.work_process}</td>
                  <td>${list.work_content}</td>
                  <td>${list.problem}</td>
                  <td>${list.other}</td>
                  <td><span><a href="reportUpdate.jsp?id=${list.report_id}" class="tablelink"><img src="../images/user_edit.png" />修改</a> <a href="/ReportDelOne?Report_id=${list.report_id}" class="tablelink" onclick="confirm('确定要删除吗？')"> <img src="../images/trash.png" />删除</a></span></td>
              </tr>
              </c:forEach>
              <%
                    session.removeAttribute("reportList");
              %>
              <%--<tbody>
                <tr>
                 <td><input name="" type="checkbox" value="" /></td>
                  <td>20130901</td>
                  <td>admin</td>
                  <td>2013-09-09 </td>
                  <td>100%</td>
                  <td>登录模块详细设计</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                 <td><span><a href="reportUpdate.jsp" class="tablelink"><img src="../images/user_edit.png" />修改</a> <a href="#" class="tablelink" onclick="confirm('确定要删除吗？')"> <img src="../images/trash.png" />删除</a></span></td>
                </tr>
                <tr>  
                 <td><input name="" type="checkbox" value="" /></td>              
                  <td>20130902</td>
                  <td>wanglin</td>
                  <td>2018-09-09 </td>
                  <td>80%</td>
                  <td>数据库设计书设计</td>
         
                  <td>详细设计问题</td>
                  <td>&nbsp;</td>
                  <td><span><a href="reportUpdate.jsp" class="tablelink"><img src="../images/user_edit.png" />修改</a> <a href="#" class="tablelink" onclick="confirm('确定要删除吗？')"> <img src="../images/trash.png" />删除</a></span></td>
                </tr>
                <tr>
                  <td><input name="" type="checkbox" value="" /></td>
                  <td>20130903</td>
                  <td>wangli</td>
                  <td>2015-09-10 </td>
                  <td>100%</td>
            
                  <td>项目启动</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td><span><a href="reportUpdate.jsp" class="tablelink"><img src="../images/user_edit.png" />修改</a> <a href="#" class="tablelink" onclick="confirm('确定要删除吗？')"> <img src="../images/trash.png" />删除</a></span></td>
                </tr>
                <tr>
                  <td><input name="" type="checkbox" value="" /></td>
                  <td>20130904</td>
                  <td>zhangli</td>
                  <td>2015-09-09 </td>
                  <td>100%</td>
                  <td>用户管理数据表设计</td>
             
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                   <td><span><a href="reportUpdate.jsp" class="tablelink"><img src="../images/user_edit.png" />修改</a> <a href="#" class="tablelink" onclick="confirm('确定要删除吗？')"> <img src="../images/trash.png" />删除</a></span></td>
                </tr>
                <tr>
                  <td><input name="" type="checkbox" value="" /></td>
                  <td>20130905</td>
                  <td>zhang_lin</td>
                  <td>2015-09-09 </td>
                  <td>100%</td>
                  <td>数据库维护</td>
                  <td>需要定期维护</td>
                  <td>&nbsp;</td>
                  <td><span><a href="reportUpdate.jsp" class="tablelink"><img src="../images/user_edit.png" />修改</a> <a href="#" class="tablelink" onclick="confirm('确定要删除吗？')"> <img src="../images/trash.png" />删除</a></span></td>
                </tr>--%>
              </tbody>
          </table></td>
        </tr>
      </tbody>
    </table>
    </td>
          </tr>
    </tbody>
    </table></td>
        </tr>
    </tbody>
    </table></form>
    
   
<div class="pagin">
    	<div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
        <li class="paginItem"><a href="javascript:;">1</a></li>
        <li class="paginItem current"><a href="javascript:;">2</a></li>
        <li class="paginItem"><a href="javascript:;">3</a></li>
        <li class="paginItem"><a href="javascript:;">4</a></li>
        <li class="paginItem"><a href="javascript:;">5</a></li>
        <li class="paginItem more"><a href="javascript:;">...</a></li>
        <li class="paginItem"><a href="javascript:;">10</a></li>
        <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>
    
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    
    
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
