package controllers.students;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Student;
import utils.DBUtil;

/**
 * Servlet implementation class StudentsFindResultServlet
 */
@WebServlet("/students/findresult")
public class StudentsFindResultServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentsFindResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //データベースにアクセス
        EntityManager em = DBUtil.createEntityManager();

        //データ受け取り用の変数を用意
        int grade = 0;
        int team = 0;
        String findResult = "学年及びクラスは1〜3の数字から選択して下さい。";

        //データの受け取り&例外処理(文字列を直接入力された場合の処理)
        try {
            grade = Integer.parseInt(request.getParameter("grade"));
            team = Integer.parseInt(request.getParameter("team"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
            em.close();
            request.setAttribute("findResult", findResult);
            //フォワード
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/students/find.jsp");
            rd.forward(request, response);
            
        }

        //データベース処理
        if (grade < 1 || grade > 3 || team < 1 || team > 3) {
            //学年・クラスで1〜3以外の数字が選択された場合の処理
            em.close();
            request.setAttribute("findResult", findResult);
            //フォワード
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/students/find.jsp");
            rd.forward(request, response);
        } else {

            //findStudentsメソッドを用いてデータをStudent型のリストstudentsに格納
            List<Student> students = em.createNamedQuery("findStudents", Student.class)
                    .setParameter("grade", grade)
                    .setParameter("team", team)
                    .setFirstResult(0) //何件目からデータを取得するか(スタートは0番目)
                    .setMaxResults(45) //データの最大取得件数(45件で固定)
                    .getResultList(); //問合せ結果の取得

            //findStudentsCountメソッドを用いてデータの件数をlong型の変数students_countに格納
            long students_count = (long)em.createNamedQuery("findStudentsConut", Long.class)
                    .setParameter("grade", grade)
                    .setParameter("team", team)
                    .getSingleResult();

            em.close();

            //検索された学年・クラス・総生徒数
            findResult = grade + "年" + team + "組: " + students_count + "名";

            //リクエストスコープにメッセージデータ, データ件数, ページ数を保存
            request.setAttribute("findResult", findResult);
            request.setAttribute("students", students);

            //フラッシュメッセージ処理
            if(request.getSession().getAttribute("flush") != null) {
                request.setAttribute("flush", request.getSession().getAttribute("flush"));
                request.getSession().removeAttribute("flush");
            }

            //フォワード
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/students/find.jsp");
            rd.forward(request, response);

        }
    }

}
