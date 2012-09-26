package com.softrayn.library;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

public class CategoryManage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CategoryManage() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String method = request.getParameter("method");
		if (method == null) {
			method = "";
		}
		if (method.equals("add")) {
			add(request, response);
		}

		else if (method.equals("list")) {
			list(request, response);
		}

		else if (method.equals("preEdit")) {
			preEdit(request, response);
		} else if (method.equals("update")) {
			update(request, response);

		} else if (method.equals("delete")) {
			delete(request, response);
		}
	}

	protected void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String categoryName = request.getParameter("categoryName");
		String borrowNumPre = request.getParameter("borrowNum");
		String borrowDaysPre = request.getParameter("borrowDays");

		int borrowNum = Integer.parseInt(borrowNumPre);
		int borrowDays = Integer.parseInt(borrowDaysPre);

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		ReaderCategoryBean category = new ReaderCategoryBean();
		category.setCategoryName(categoryName);
		category.setBorrowNum(borrowNum);
		category.setBorrowDays(borrowDays);
		session.save(category);
		session.getTransaction().commit();

	}

	protected void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();

		@SuppressWarnings("rawtypes")
		List list = session.createQuery("from ReaderCategoryBean").list();

		request.setAttribute("list", list);
		request.getRequestDispatcher("/showAllCategory.jsp").forward(request,
				response);

		session.getTransaction().commit();

	}

	protected void preEdit(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String dbId = request.getParameter("id");
		int id = Integer.parseInt(dbId);
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();

		ReaderCategoryBean category = (ReaderCategoryBean) session.get(
				ReaderCategoryBean.class, id);
		request.setAttribute("category", category);
		request.getRequestDispatcher("/editCategory.jsp").forward(request,
				response);
		session.getTransaction().commit();

	}

	protected void update(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String dbId = request.getParameter("dbId");
		int categoryId = Integer.parseInt(dbId);
		String categoryName = request.getParameter("categoryName");
		String borrowNumPre = request.getParameter("borrowNum");
		String borrowDaysPre = request.getParameter("borrowDays");

		int borrowNum = Integer.parseInt(borrowNumPre);
		int borrowDays = Integer.parseInt(borrowDaysPre);

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		ReaderCategoryBean category = (ReaderCategoryBean) session.get(
				ReaderCategoryBean.class, categoryId);

		category.setCategoryName(categoryName);
		category.setBorrowNum(borrowNum);
		category.setBorrowDays(borrowDays);

		session.update(category);
		session.getTransaction().commit();

	}

	protected void delete(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String dbId = request.getParameter("id");
		int id = Integer.parseInt(dbId);

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();

		ReaderCategoryBean category = (ReaderCategoryBean) session.get(
				ReaderCategoryBean.class, id);

		System.out.println(category.getCategoryName());
		session.delete(category);
		session.getTransaction().commit();

	}

}
