package controllers.teachers;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Teacher;
import utils.DBUtil;

/**
 * Servlet implementation class TeachersEditServlet
 */
@WebServlet("/teachers/edit")
public class TeachersEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeachersEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //データベースにアクセス
        EntityManager em = DBUtil.createEntityManager();

        //findメソッドを用いて該当IDのデータ一件をTeacher型のインスタンスに格納
        Teacher t = em.find(Teacher.class, Integer.parseInt(request.getParameter("id")));

        em.close();

        //リクエストスコープに取得したデータ一件, セッションID, リクエストスコープにIDを保存
        if(t != null) {
        request.setAttribute("teacher", t);
        request.setAttribute("_token", request.getSession().getId());
        request.getSession().setAttribute("teacher_id", t.getId());
        }

        //フォワード
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/teachers/edit.jsp");
        rd.forward(request, response);

    }

}
