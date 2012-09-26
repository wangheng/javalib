<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.softrayn.library.BorrowBean"%>
<%@ page import="com.softrayn.library.BookBean"%>
<%@ page import="com.softrayn.library.ReaderBean"%>
<%@ page import="java.util.List"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="com.softrayn.library.HibernateUtil"%>
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
<title>您的所有借阅</title>
</head>
<body>
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
							<b>借阅管理</b>
						</div>

						<div class=line></div>
						<table width="100%" id="adm_log_list" class="item_list">
							<thead>
								<tr>
									<th width="400"><b>图书名称</b></th>
									<th width="146"><b>读者名称</b></th>
									<th width="150"><b>借阅时间</b></th>
									<th width="100"><b>应还时间</b></th>
									<th width="100" class="tdcenter"><b>归还时间</b></th>
									<th width="80" class="tdcenter"><b>归还</b></th>
								</tr>

							</thead>
							<tbody>

								<%
									@SuppressWarnings({ "unchecked" })
									List<BorrowBean> list = (List<BorrowBean>) request
											.getAttribute("list");
									BorrowBean borrow = new BorrowBean();
								%>
								<%
									for (int i = 0; i < list.size(); i++) {

										borrow = (BorrowBean) list.get(i);
								%>
								<tr>

									<td><p>
											<%
												Session session2 = HibernateUtil.getSessionFactory()
															.getCurrentSession();
													BookBean book = (BookBean) session2.get(BookBean.class,
															borrow.getBooksId());
													out.print(book.getBooksName());
											%>
										</p></td>
									<td><p>
											<%
												Session session3 = HibernateUtil.getSessionFactory()
															.getCurrentSession();
													ReaderBean reader = (ReaderBean) session3.get(ReaderBean.class,
															borrow.getReadersId());
													out.print(reader.getReadersName());
											%>
										</p></td>
									<td><p><%=borrow.getBorrowDate().toString().substring(0, 11)%></p></td>
									<td><p><%=borrow.getShouldReturnDate().toString()
						.substring(0, 11)%></p></td>
									<td></td>
									<td class="tdcenter"><a
										href="/library/BorrowManage?method=delete&booksId=<%=book.getId()%>"
										onclick="javascript:return del()"><img
											src="/library/images/icon_del.gif" /></a></td>

								</tr>
								<%
									}
								%>
							
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>
