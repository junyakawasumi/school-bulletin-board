<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <h2>教職員検索ページ</h2>

        <form method="GET" action="<c:url value='/teachers/findresult' />">
            <tr>
                <td>氏名: </td>
                <td><input type="text" name="keyword" size="30" /></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="検索" /></td>
            </tr>
        </form>

        <h2>[<c:out value="${keyword}" />]の検索ヒット数: <c:out value="${teachers_count}" /></h2>
        <table id="teacher_list">
            <tbody>
                <tr>
                    <th>教職員番号</th>
                    <th>氏名</th>
                    <th>操作</th>
                </tr>
                <c:forEach var="teacher" items="${teachers}" varStatus="status"> <%-- 教職員のデータを繰り返し表示(最大15件) --%>
                    <tr class="row${status.count % 2}">
                        <td><c:out value="${teacher.code}" /></td> <%-- 教職員番号 --%>
                        <td><c:out value="${teacher.name}" /></td> <%-- 氏名 --%>
                        <td>
                            <c:choose>
                                <c:when test="${teacher.delete_flag == 1}"> <%-- delete_flagが1の場合(削除済)の処理 --%>
                                    [削除済み]
                                </c:when>
                                <c:otherwise>
                                    <a href="<c:url value='/teachers/show?id=${teacher.id}' />">詳細を表示</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination"> <%-- ページネーション --%>
            (全 ${teachers_count} 件)<br />
            <c:forEach var="i" begin="1" end="${((teachers_count - 1) / 5) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/teachers/findresult?keyword=${keyword}&page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

        <p><a href="<c:url value='/teachers/index' />">教職員一覧に戻る</a></p>
    </c:param>
</c:import>
