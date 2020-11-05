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
                <c:forEach var="teacher" items="${teachers}" varStatus="status"> <%-- 教職員のデータを繰り返し表示(最大10件) --%>
                    <tr class="row${status.count % 2}">
                        <td><c:out value="${teacher.code}" /></td> 
                        <td><c:out value="${teacher.name}" /></td>
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
            <c:forEach var="i" begin="1" end="${((teachers_count - 1) / 10) + 1}" step="1">
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
        
        <h2><c:out value="${keyword}" />先生の最新メッセージ</h2>
        <table id="message_list"> <%-- 検索された教職員のメッセージを表示 最大５件 --%>
            <tbody>
                <tr>
                    <th class="message_name">氏名</th>
                    <th class="message_date">日付</th>
                    <th class="message_title">タイトル</th>
                    <th class="message_action">操作</th>
                </tr>
                <c:forEach var="message" items="${messages}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class="message_name"><c:out value="${message.teacher.name}" /></td>
                        <td class="message_date"><fmt:formatDate value='${message.message_date}' pattern='yyyy-MM-dd' /></td>
                        <td class="message_title">${message.title}</td>
                        <td class="message_action"><a href="<c:url value='/messages/show?id=${message.id}' />">詳細を見る</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <p><a href="<c:url value='/teachers/index' />">教職員一覧に戻る</a></p>
    </c:param>
</c:import>
