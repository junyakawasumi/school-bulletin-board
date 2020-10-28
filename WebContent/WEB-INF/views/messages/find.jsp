<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <h2>メッセージ検索ページ</h2>
        
        <form method="GET" action="<c:url value='/messages/findresult' />" >
            <tr>
                <td>キーワード: </td>
                <td><input type="text" name="keyword" /></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="検索" /></td>
            </tr>
        </form>
        <p>メッセージのタイトル・内容・投稿者で検索ができます。</p>
        
        <h2><c:out value="${keyword}" />検索ヒット数: <c:out value="${messages_count}" /></h2>
        <table id="message_list">
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

        <div id="pagination">
            （全 ${messages_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((messages_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/messages/findresult?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="<c:url value='/messages/index' />">メッセージ一覧に戻る</a></p>
    </c:param>
</c:import>