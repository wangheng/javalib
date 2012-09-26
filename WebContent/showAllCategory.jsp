<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List"%>
<%@ page import="com.softrayn.library.ReaderCategoryBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>显示所有的分类</title>
</head>
<body>
	<%
		@SuppressWarnings({ "unchecked" })
		List<ReaderCategoryBean> list = (List<ReaderCategoryBean>) request.getAttribute("list");
		ReaderCategoryBean category = new ReaderCategoryBean();
	%>
	<%
		for (int i = 0; i < list.size(); i++) {
			category = (ReaderCategoryBean) list.get(i);
	%>
	<table>
		<tr>
			<td><p>ID：</p></td>
			<td><p><%=category.getCategoryId()  %></td>
		</tr>
		<tr>
			<td><p>分类名称：</p></td>
			<td><p><%=category.getCategoryName()  %></p></td>

		</tr>
		<tr>
			<td><p>最大借书数目：</p></td>
			<td><p><%=category.getBorrowNum() %></p></td>
		</tr>
		<tr>
			<td><p>最大借书日期:</p></td>
			<td><p><%=category.getBorrowDays() %></p></td>
		</tr>
	</table>

	<%
		}
	%>
</body>
</html>