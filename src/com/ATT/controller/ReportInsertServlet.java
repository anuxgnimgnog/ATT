package com.ATT.controller;

import com.ATT.services.ReportInsert;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ReportInsertServlet",urlPatterns = "/ReportInsertServlet")
public class ReportInsertServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String name = request.getParameter("insertname");
        String report_date = request.getParameter("insertdate");
        String process = request.getParameter("insertprocess");
        String content = request.getParameter("insetrcontent");
        String plan = request.getParameter("insertplan");
        String problem = request.getParameter("insertproblem");
        String other = request.getParameter("insertother");
        ReportInsert.ReportInsert(name,report_date,process,content,plan,problem,other);
        response.sendRedirect(request.getContextPath()+"report/reportSearch.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
