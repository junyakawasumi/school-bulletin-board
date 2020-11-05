<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <h2>クラス別表示ページ</h2>
        <p>学年・クラスを選択して下さい。</p>

        <form method="GET" action="<c:url value='/students/findresult' />">
            <label for="grade"></label>
            <select name="grade">
                <option value="1"<c:if test="${student.grade == 1}"> selected</c:if>>1</option>
                <option value="2"<c:if test="${student.grade == 2}"></c:if>>2</option>
                <option value="3"<c:if test="${student.grade == 3}"></c:if>>3</option>
            </select>
            <span>年</span>
            <label for="team"></label>
            <select name="team">
                <option value="1"<c:if test="${student.team == 1}"> selected</c:if>>1</option>
                <option value="2"<c:if test="${student.team == 2}"></c:if>>2</option>
                <option value="3"<c:if test="${student.team == 3}"></c:if>>3</option>
            </select>
            <span>組</span>
            <input type="submit" value="表示" />
        </form>

        <h2><c:out value="${findResult}" /></h2>
        <table id="student_list">
            <tbody>
                <tr>
                    <th>学生証番号</th>
                    <th>学年</th>
                    <th>クラス</th>
                    <th>氏名</th>
                    <th>操作</th>
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
                                    <a href="<c:url value='/students/show?id=${student.id}' />">詳細を表示</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <p><a href="<c:url value='/students/index' />">生徒一覧に戻る</a></p>
    </c:param>
</c:import>
