<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.softrayn.library.ReaderCategoryBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改读者分类内容</title>
</head>
<body>
<%
ReaderCategoryBean category = (ReaderCategoryBean)request.getAttribute("category");
%>
<h1>请输入要修改的信息</h1>
<form action="/library/CategoryManage" method="post">
<input type="hidden" name="method" value="update"/>
<input type="hidden" name="dbId" value="<%=category.getCategoryId() %>" />
<table>
<tr>
<td><p>分类名称：</p></td>
<td><input type="text" name="categoryName" value="<%=category.getCategoryName() %>"/></td>
</tr>
<tr>
<td><p>能借书数目</p></td>
<td><input type="text" name="borrowNum" value="<%=category.getBorrowNum() %>"/></td>
</tr>
<tr>
<td><p>能借书日期：</p></td>
<td><input type="text" name="borrowDays" value="<%=category.getBorrowDays() %>" /></td>
</tr>
</table>
<input type="submit" value="修改" />
<input type="reset" value="重置" />
</form>
</body>
</html>