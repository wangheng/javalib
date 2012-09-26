package com.softrayn.library;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;

public class UserFunction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserFunction() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String method = request.getParameter("method");
		if (method == null) {
			method = "";
		} else if (method.equals("login")) {
			login(request, response);
		} else if (method.equals("select")) {
			select(request, response);
		}
	}

	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();

		Query query = session
				.createQuery("from AdminBean ab where ab.adminName = :username");
		query.setParameter("username", username);
		@SuppressWarnings("rawtypes")
		List admins = query.list();
		if (admins.size() > 0) {
			AdminBean admin = (AdminBean) admins.get(0);
			if (admin.getPassword().equals(password)) {

				request.setAttribute("admin", admin);
				request.getRequestDispatcher("/admin/admin.jsp").forward(
						request, response);
			} else {
				request.getRequestDispatcher("/login.jsp").forward(request,
						response);
			}

		} else {
			Query query2 = session
					.createQuery("from ReaderBean rb where rb.readersName = :username and rb.password = :password");
			query2.setParameter("username", username);
			query2.setParameter("password", password);

			@SuppressWarnings("rawtypes")
			List readers = query2.list();
			if (readers.get(0) != null) {
				ReaderBean reader = (ReaderBean) readers.get(0);
				request.setAttribute("reader", reader);
				request.getRequestDispatcher("/UserSelect.jsp").forward(
						request, response);
			} else {
				request.getRequestDispatcher("/login.jsp").forward(request,
						response);
			}
		}

	}

	public void select(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String keyWords = request.getParameter("keyWords");
		String readersId = request.getParameter("readersId");
		int id = Integer.parseInt(readersId);

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		ReaderBean reader = (ReaderBean) session.get(ReaderBean.class, id);
		Query query = session
				.createQuery("from BookBean bk where bk.booksName like '%"
						+ keyWords + "%'");

		@SuppressWarnings("rawtypes")
		List list = query.list();
		request.setAttribute("list", list);
		request.setAttribute("reader", reader);
		request.getRequestDispatcher("/BooksToLend.jsp").forward(request,
				response);

		session.getTransaction().commit();
	}

}
