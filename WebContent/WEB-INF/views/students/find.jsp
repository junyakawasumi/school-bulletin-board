<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">

        <h3 class="text-center mb-3">クラス別表示ページ</h3>
        <small class="form-text text-muted text-center">学年・クラスを選択して下さい。</small>

        <%-- フォーム --%>
        <form method="GET" action="<c:url value='/students/findresult' />" class="mb-3">
            <div class="form-group">
                <label for="grade"></label>
                <select name="grade" class="form-control">
                    <option value="1"<c:if test="${student.grade == 1}"> selected</c:if>>1年</option>
                    <option value="2"<c:if test="${student.grade == 2}"></c:if>>2年</option>
                    <option value="3"<c:if test="${student.grade == 3}"></c:if>>3年</option>
                </select>
            </div>
            <div class="form-group">
                <label for="team"></label>
                <select name="team" class="form-control">
                    <option value="1"<c:if test="${student.team == 1}"> selected</c:if>>1組</option>
                    <option value="2"<c:if test="${student.team == 2}"></c:if>>2組</option>
                    <option value="3"<c:if test="${student.team == 3}"></c:if>>3組</option>
                </select>
            </div>
            <button type="submit" class="btn btn-outline-info mb-2">表示</button>
        </form>

        <%-- 検索結果を表示 --%>
        <c:choose>
            <c:when test="${students_count != 0}">
                <h2><c:out value="${findResult}" /></h2>
                <table class="table">
                    <tbody>
                        <tr>
                            <th scope="col">学生証番号</th>
                            <th scope="col">学年</th>
                            <th scope="col">クラス</th>
                            <th scope="col">氏名</th>
                            <th scope="col">操作</th>
                        </tr>
                        <c:forEach var="student" items="${students}" varStatus="status"> <%-- 生徒のデータを繰り返し表示(最大45件) --%>
                            <tr class="row${status.count % 2}">
                                <td><c:out value="${student.code}" /></td> <%-- 学生証番号 --%>
                                <td><c:out value="${student.grade}" /></td> <%-- 学年 --%>
                                <td><c:out value="${student.team}" /></td> <%-- クラス --%>
                                <td><c:out value="${student.name}" /></td> <%-- 氏名 --%>
                                <td>
                                    <c:choose>
                                        <c:when test="${student.delete_flag == 1}"> <%-- delete_flagが1の場合(削除済)の処理 --%>
                                            [削除済み]
                                        </c:when>
                                        <c:otherwise>
                                            <a href="<c:url value='/students/show?id=${student.id}' />" class="btn btn-outline-info">詳細</a>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <%-- 検索ワードが１〜３以外だった場合の処理 --%>
            <c:otherwise>
                    <div class="alert alert-warning mb-3 text-center" role="alert">学年及びクラスは1〜3の数字から選択して下さい。</div> 
            </c:otherwise>
        </c:choose>
    
        <%-- リンク --%>
        <p><a href="<c:url value='/students/index' />" class="text-info">生徒一覧に戻る</a></p>

    </c:param>
</c:import>
