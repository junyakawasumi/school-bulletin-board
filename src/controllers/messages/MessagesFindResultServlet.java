package controllers.messages;

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
import utils.DBUtil;

/**
 * Servlet implementation class MessagesFindResultServlet
 */
@WebServlet("/messages/findresult")
public class MessagesFindResultServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessagesFindResultServlet() {
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

        // keywordが選択されなかった場合はmessageindexへフォワード
        if (keyword == null || keyword.equals("")) {
            response.sendRedirect(request.getContextPath() + "/messages/index");
        } else {

        //findMessages(JPQL)を用いてデータをMessage型のリストmessagesに格納
        List<Message> messages = em.createNamedQuery("findMessages", Message.class)
                .setParameter("title", "%" + keyword + "%")
                .setParameter("content", "%" + keyword + "%")
                .setParameter("name", "%" + keyword + "%")
                .setFirstResult(10 * (page - 1)) //何件目からデータを取得するか(スタートは0番目)
                .setMaxResults(10) //データの最大取得件数(10件で固定)
                .getResultList(); //問合せ結果の取得

        //findMessagesCount(JPQL)を用いてデータの件数をlong型の変数messages_countに格納
        long messages_count = (long)em.createNamedQuery("findMessagesCount", Long.class)
                .setParameter("title", "%" + keyword + "%")
                .setParameter("content", "%" + keyword + "%")
                .setParameter("name", "%" + keyword + "%")
                .getSingleResult();

        em.close();

        //リクエストスコープに検索ワード、メッセージデータ, データ件数, ページ数を保存
        request.setAttribute("keyword", keyword);
        request.setAttribute("messages", messages);
        request.setAttribute("messages_count", messages_count);
        request.setAttribute("page", page);

        //フラッシュメッセージ処理
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        //フォワード
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/messages/find.jsp");
        rd.forward(request, response);

        }
    }

}
