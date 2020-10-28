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

import models.Teacher;
import utils.DBUtil;

/**
 * Servlet implementation class TeachersIndexServlet
 */
@WebServlet("/teachers/index")
public class TeachersIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeachersIndexServlet() {
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
        int page = 1;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        } catch(NumberFormatException e) { }

        //getAllTeachersメソッドを用いてデータをTeacher型のリストteachersに格納
        List<Teacher> teachers = em.createNamedQuery("getAllTeachers", Teacher.class)
                                     .setFirstResult(15 * (page - 1)) //何件目からデータを取得するか(スタートは0番目)
                                     .setMaxResults(15) //データの最大取得件数(15件で固定)
                                     .getResultList(); //問合せ結果の取得

        //getTeachersCountメソッドを用いてデータの件数をlong型の変数teachers_countに格納
        long teachers_count = (long)em.createNamedQuery("getTeachersCount", Long.class)
                                       .getSingleResult(); //件数が返るのでSingleResult

        em.close();

        //リクエストスコープに教職員データ, データ件数, ページ数を保存
        request.setAttribute("teachers", teachers);
        request.setAttribute("teachers_count", teachers_count);
        request.setAttribute("page", page);

        //フラッシュメッセージのチェック
        //フラッシュメッセージがセッションスコープに保存されていたら、取得し、リクエストスコープに保存(セッションスコープからは削除)
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        //フォワード
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/teachers/index.jsp");
        rd.forward(request, response);
    }

}
