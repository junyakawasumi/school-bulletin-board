package controllers.teachers;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Message;
import models.Teacher;
import utils.DBUtil;

/**
 * Servlet implementation class TeachersFindResultServlet
 */
@WebServlet("/teachers/findresult")
public class TeachersFindResultServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeachersFindResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //データベースにアクセス
        EntityManager em = DBUtil.createEntityManager();

        //ページネーション
        //開くページ数を取得(デフォルトは１ページ目)
        int page;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        } catch(NumberFormatException e) {
            page = 1;
        }

        String keyword = request.getParameter("keyword");

        // keywordが選択されなかった場合はteachersindexへフォワード
        if (keyword == null || keyword.equals("")) {
            response.sendRedirect(request.getContextPath() + "/teachers/index");
        } else {

        //findTeachers(JPQL)を用いてデータをTeacher型のリストteachersに格納
        List<Teacher> teachers = em.createNamedQuery("findTeachers", Teacher.class)
                .setParameter("name", "%" + keyword + "%")
                .setFirstResult(10 * (page - 1)) //何件目からデータを取得するか(スタートは0番目)
                .setMaxResults(10) //データの最大取得件数(10件で固定)
                .getResultList(); //問合せ結果の取得

        //findTeachersCount(JPQL)を用いてデータの件数をlong型の変数teachers_countに格納
        long teachers_count = (long)em.createNamedQuery("findTeachersCount", Long.class)
                .setParameter("name", "%" + keyword + "%")
                .getSingleResult();
        
        //findTeachersMessages(JPQL)を用いてデータのmessage型のリストmessagesに格納
        List<Message> messages = em.createNamedQuery("findTeachersMessages", Message.class)
                .setParameter("name", "%" + keyword + "%")
                .setFirstResult(5 * (page - 1)) //何件目からデータを取得するか(スタートは0番目)
                .setMaxResults(5) //データの最大取得件数(5件で固定)
                .getResultList(); //問合せ結果の取得

        em.close();

        //リクエストスコープに検索ワード、教職員データ及びデータ件数、メッセージデータ, ページ数を保存
        request.setAttribute("keyword", keyword);
        request.setAttribute("teachers", teachers);
        request.setAttribute("teachers_count", teachers_count);
        request.setAttribute("messages", messages);
        request.setAttribute("page", page);

        //フラッシュメッセージ処理
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        //フォワード
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/teachers/find.jsp");
        rd.forward(request, response);

        }
    }

}
