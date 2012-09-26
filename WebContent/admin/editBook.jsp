<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.softrayn.library.BookBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/library/css/manage.css" type=text/css rel=stylesheet>
<link href="/library/css/css-main.css" type=text/css rel=stylesheet>
<script type="text/javascript" src="../js/jquery/jquery-1.2.6.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<style type='text/css'>
#tip {
	background: url(../content/plugins/tips/icon_tips.gif) no-repeat left
		3px;
	padding: 3px 18px;
	margin: 5px 0px;
	font-size: 12px;
	color: #999999;
}
</style>
<title>修改读者信息</title>
</head>
<body>
	<%
		BookBean book = (BookBean) request.getAttribute("book");
	%>
	<div class="center">
		<table id=header cellspacing=0 cellpadding=0 width="988" border=0>
			<tbody>
				<tr>
					<td width="9" id="headerleft"></td>
					<td class="home" align="left"><a href="/library/"
						target="_blank" title="在新窗口中浏览">去首页 </a></td>
					<td align=right nowrap class="headtext">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
						<a href="/library/admin/admin.jsp">管理首页</a>&nbsp;&nbsp;|&nbsp;&nbsp;
						<a href="../User?method=logout">退出</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td width="9" id="headerright"></td>
			</tbody>
		</table>
		<table cellspacing=0 cellpadding=0 width="100%" border=0>
			<tbody>
				<tr>

					<td valign=top align=left width="114">
						<div id=sidebartop></div>
						<table cellspacing=0 cellpadding=0 width="100%" border=0>
							<tbody>
								<tr>
									<td valign=top align=left width="114">
										<div id=sidebar>
											<div class="sidebarmenu"
												onclick="displayToggle('log_mg', 1);">读者管理</div>

											<div id="log_mg">
												<div class="sidebarsubmenu" id="menu_wt">
													<a href="/library/addReader">添加读者</a>
												</div>
												<div class="sidebarsubmenu" id="menu_draft">
													<a href="/library/ReaderManage?method=list">读者列表<span
														id="dfnum"> </span></a>
												</div>
											</div>
										</div>
									</td>
								</tr>

							</tbody>
						</table>
						<table cellspacing=0 cellpadding=0 width="100%" border=0>
							<tbody>
								<tr>
									<td valign=top align=left width="114">
										<div id=sidebar>
											<div class="sidebarmenu"
												onclick="displayToggle('log_mg', 1);">书籍管理</div>

											<div id="log_mg">
												<div class="sidebarsubmenu" id="menu_wt">
													<a href="/library/admin/addBook.jsp">添加书籍</a>
												</div>
												<div class="sidebarsubmenu" id="menu_draft">
													<a href="/library/BookManage?method=list">书籍列表<span
														id="dfnum"> </span></a>
												</div>
											</div>
										</div>
									</td>
								</tr>

							</tbody>
						</table>
						<table cellspacing=0 cellpadding=0 width="100%" border=0>
							<tbody>
								<tr>
									<td valign=top align=left width="114">
										<div id=sidebar>
											<div class="sidebarmenu"
												onclick="displayToggle('log_mg', 1);">借书管理</div>

											<div id="log_mg">
												<div class="sidebarsubmenu" id="menu_draft">
													<a href="/nextplus-blog/Comment?method=list">借书管理<span
														id="dfnum"> </span></a>
												</div>
											</div>
										</div>
									</td>
								</tr>

							</tbody>
						</table>
					</td>
					<td id=container valign=top align=left>
						<div class=containertitle>
							<b>修改图书信息</b><span id="msg_2"></span>
						</div>
						<div id="msg"></div>
						<form action="/library/BookManage" method="post" id="addlog">
							<input type="hidden" name="method" value="update" />
		<input type="hidden" name="dbId" value="<%=book.getId() %>" />
							<table cellspacing="1" cellpadding="4" width="720" border="0">
								<tbody>
									<tr>
										<td>书名：</td>
										<td><input type="text" maxlength="100"
											style="width: 300px;" name="booksName" value="<%=book.getBooksName() %>" id="title" /></td>
									</tr>
									<tr>
										<td >分类：</td>
										<td><input type="text" maxlength="200"
											style="width: 300px;" name="category" value="<%=book.getCategory() %>" id="title" /></td>
									</tr>
									<tr>
										<td>关键字：</td>
										<td><input type="text" maxlength="200"
											style="width: 300px;" name="keyWords" id="title" value="<%=book.getKeyWords() %>"/></td>
									</tr>
				<tr>
										<td>备注：</td>
										<td><input type="text" maxlength="200"
											style="width: 300px;" name="remarks" id="title" value="<%=book.getRemarks() %>"/></td>
									</tr>
				

								</tbody>
							</table>
							<table cellspacing="1" cellpadding="4" width="720" border="0">
								<tr>
									<td align="center"><br> <input type="submit"
										value="确认修改" onclick="return checkform();" class="button" />
									</td>
								</tr>
							</table>
						</form>
					</td>
				
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>