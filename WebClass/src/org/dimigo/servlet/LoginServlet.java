package org.dimigo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.printf("id : %s , pwd : %s\n" , id,pwd);
		
		/*
		 * {
		 * 	"id" : test
		 * }
		 */
		
//		out.println("{");
//		out.println("\"id\" : " + id);
//		out.println("}");
		
		class ID{
			public String id;
		}
		ID id1 = new ID();
		id1.id = id;
		Gson gson = new Gson();
		System.out.println(gson.toJson(id1));
		out.write(gson.toJson(id1));
		
		
		out.close();
	}

}
