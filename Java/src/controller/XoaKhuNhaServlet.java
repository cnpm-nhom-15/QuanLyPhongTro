package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.User;
import model.bo.KhuNhaBO;

/**
 * Servlet implementation class XoaKhuNhaServlet
 */
@WebServlet("/XoaKhuNhaServlet")
public class XoaKhuNhaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XoaKhuNhaServlet() {
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
//		response.getWriter().append("Served at: ").append(request.getContextPath());
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
		String str = request.getParameter("idKhuNha");
		KhuNhaBO khuNhaBO = new KhuNhaBO();
		PrintWriter pw = response.getWriter();
		if (khuNhaBO.xoaKhuNha(Integer.parseInt(str))) {
			request.setAttribute("thanhCong", "Xoá thành công");

		} else {

			request.setAttribute("thatBai", "Xoá thất bại");
		}
		RequestDispatcher rd = request.getRequestDispatcher("DanhSachKhuNhaServlet");
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
