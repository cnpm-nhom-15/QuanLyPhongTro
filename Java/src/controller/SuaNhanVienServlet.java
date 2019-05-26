package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.User;

/**
 * Servlet implementation class SuaNhanVienServler
 */
@WebServlet("/SuaNhanVienServlet")
public class SuaNhanVienServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SuaNhanVienServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		HttpSession hs = request.getSession();
		User acc = (User) hs.getAttribute("user");
		if (acc != null) {
			if (acc.getUserType() == 1) {
				response.sendRedirect("404.jsp");
				return;
			}
		} else {

			response.sendRedirect("IndexServlet");
			return;
		}
		if ("suaNV".equals(request.getParameter("suaNV"))) {
			RequestDispatcher rd = request.getRequestDispatcher("DanhSachNhanVienServlet");
			rd.include(request, response);
			return;
		}
		request.setAttribute("thatBai", "Đang hoàn thiện");
		RequestDispatcher rd = request.getRequestDispatcher("admin/qlNhanVien/suaNhanVien.jsp");
		rd.include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
