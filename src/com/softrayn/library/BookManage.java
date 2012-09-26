package com.softrayn.library;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

public class BookManage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BookManage() {
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
		}else if(method.equals("delete")){
			delete(request, response);
		}
	}

	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String booksName = request.getParameter("booksName");
		String category = request.getParameter("category");
		String keyWords = request.getParameter("keyWords");
		String remarks = request.getParameter("remarks");

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();

		BookBean book = new BookBean();

		book.setBooksName(booksName);
		System.out.println(book.getBooksName());
		book.setCategory(category);
		book.setKeyWords(keyWords);
		book.setRemarks(remarks);

		session.save(book);
		session.getTransaction().commit();
		
		request.getRequestDispatcher("BookManage?method=list").forward(request, response);

	}

	@SuppressWarnings("rawtypes")
	public void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();

		List list = session.createQuery("from BookBean").list();
		request.setAttribute("list", list);
		List booksLended = session.createQuery("from BorrowBean").list();
		request.setAttribute("booksLended", booksLended);
		request.getRequestDispatcher("/admin/showAllBooks.jsp").forward(request,
				response);
		
		

		session.getTransaction().commit();

	}

	public void preEdit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String dbId = request.getParameter("id");
		int id = Integer.parseInt(dbId);
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();

		BookBean book = (BookBean) session.get(BookBean.class, id);
	
		request.setAttribute("book", book);
		request.getRequestDispatcher("/admin/editBook.jsp")
				.forward(request, response);
		session.getTransaction().commit();
	}

	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String dbId = request.getParameter("dbId");
		int id = Integer.parseInt(dbId);
		String booksName = request.getParameter("booksName");
		String category = request.getParameter("category");
		String keyWords = request.getParameter("keyWords");
		String remarks = request.getParameter("remarks");

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		session.beginTransaction();
		
		BookBean book = (BookBean)session.get(BookBean.class, id);

		book.setBooksName(booksName);
		book.setCategory(category);
		book.setKeyWords(keyWords);
		book.setRemarks(remarks);

		session.update(book);
		session.getTransaction().commit();

		request.getRequestDispatcher("BookManage?method=list").forward(request, response);

	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dbId = request.getParameter("id");
		int id = Integer.parseInt(dbId);
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		
		BookBean book = (BookBean)session.get(BookBean.class, id);
		session.delete(book);
		session.getTransaction().commit();

		request.getRequestDispatcher("BookManage?method=list").forward(request, response);

	}

}
