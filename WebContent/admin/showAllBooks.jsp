<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.softrayn.library.BookBean"%>
<%@ page import="com.softrayn.library.ReaderCategoryBean"%>
<%@ page import="com.softrayn.library.HibernateUtil"%>
<%@ page import="org.hibernate.Session"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>所有图书列表</title>
</head>
<body>
<script type="text/javascript">		
			function del() {
				var msg = "您真的确定要删除吗？\n\n请确认！";
				if (confirm(msg)==true){
						return true;
					}else{
						return false;
					}
				}
</script>

	<%
		@SuppressWarnings({ "unchecked" })
		List<BookBean> list = (List<BookBean>) request.getAttribute("list");
		BookBean book = new BookBean();
		
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
													<a href="BookManage?method=list">书籍列表<span
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
							<b>读者管理</b>
						</div>

						<div class=line></div>
						<table width="100%" id="adm_log_list" class="item_list">
							<thead>
								<tr>
									<th width="21"><input onclick="CheckAll(this.form)"
										type="checkbox" value="on" name="chkall" /></th>
									<th width="146"><b>ID</b></th>
									<th width="400"><b>书名</b></th>
									
									<th width="150"><b>关键字</b></th>
									<th width="100"><b><a href="#">分类</a></b></th>
									<th width="100" class="tdcenter"><b>备注</b></th>
									<th width="40" class="tdcenter"><b><a href="#">编辑</a></b></th>
									<th width="40" class="tdcenter"><b><a href="#">删除</a></b></th>
								</tr>

							</thead>
							<tbody>
								<%
		for (int i = 0; i < list.size(); i++) {

			book = (BookBean) list.get(i);
			
	%>
								<tr>
									<td><input type="checkbox" name="blog[]" value="3"
										class="ids" /></td>
									<td><a href="#"><%=book.getId() %></a></td>
									<td><a href="#"></a><%=book.getBooksName() %></td>
									<td class="tdcenter"><a href="#"><%=book.getKeyWords() %></a></td>

									<td><a href="#"><%=book.getCategory() %></a></td>
									<td><%=book.getRemarks() %></td>
									<td class="tdcenter"><a
										href="/library/BookManage?method=preEdit&id=<%=book.getId() %>"><img
											src="/library/images/addblog.gif" /></a></td>
									<td class="tdcenter"><a
										href="/library/BookManage?method=delete&id=<%=book.getId()  %>"
										onclick="javascript:return del()"><img
											src="/library/images/icon_del.gif" /></a></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>