package com.java.am.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.am.Config;
import com.java.am.controller.ArticleController;
import com.java.am.exception.SQLErrorException;
import com.java.am.util.DBUtil;
import com.java.am.util.SecSql;

@WebServlet("/s/*")
public class DispatcherServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 커넥터 드라이버 활성화
		String driverName = Config.getDBDriverClassName();

		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			System.err.printf("[ClassNotFoundException 예외, %s]\n", e.getMessage());
			response.getWriter().append("DB 드라이버 클래스 로딩 실패");
			return;
		}

		// DB 연결
		Connection con = null;

		try {
			con = DriverManager.getConnection(Config.getDBUrl(), Config.getDBId(), Config.getDBPw());
			
			String requestUri = request.getRequestURI();
			String[] requestUriBits = requestUri.split("/");
			
			if(requestUriBits.length < 5) {
				response.getWriter().append("올바른 요청이 아닙니다.");
				return;
			}

			String ControllerName = requestUriBits[3];
			String actionMethodName = requestUriBits[4];
			
			if (ControllerName.equals("article")) {
				ArticleController controller = new ArticleController(request, response, con);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (SQLErrorException e) {
			e.getOrigin().printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}