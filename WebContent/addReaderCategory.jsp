<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加读者分类</title>
</head>
<body>
<form action="/library/CategoryManage" method="post">
<input type="hidden" name="method" value="add"/>
<table>
<tr>
<td><p>分类名称：</p></td>
<td><input type="text" name="categoryName" /></td>
</tr>
<tr>
<td><p>能借书数目</p></td>
<td><input type="text" name="borrowNum" /></td>
</tr>
<tr>
<td><p>能借书日期：</p></td>
<td><input type="text" name="borrowDays" /></td>
</tr>
</table>
<input type="submit" value="添加" />
<input type="reset" value="重置" />
</form>
</body>
</html>