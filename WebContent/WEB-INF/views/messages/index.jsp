<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">

        <%-- フラッシュメッセージ --%>
        <c:if test="${flush != null}">
            <div id="flush_success" class="alert alert-success text-center" role="alert">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>

        <h3 class="text-center mb-4">メッセージ 一覧</h3>

        <%-- メッセージ一覧を表示 --%>
        <table class="table">
            <tbody>
                <tr>
                    <th scope="col">氏名</th>
                    <th scope="col">日付</th>
                    <th scope="col">タイトル</th>
                    <th scope="col">操作</th>
                </tr>
                <c:forEach var="message" items="${messages}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td><c:out value="${message.teacher.name}" /></td> <%-- 氏名 --%>
                        <td><fmt:formatDate value='${message.message_date}' pattern='yyyy-MM-dd' /></td> <%-- 日付 --%>
                        <td>${message.title}</td> <!-- タイトル -->
                        <td><a href="<c:url value='/messages/show?id=${message.id}' />" class="btn btn-outline-info">詳細</a></td> <%-- 詳細(showへのリンク) --%>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <%-- ページネーション --%>
        <div id="pagination" class="mb-3">
            （全 ${messages_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((messages_count - 1) / 15) + 1}" step="1"> <%-- データを最大１５件表示 --%>
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/messages/index?page=${i}' />" class="text-info"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

        <%-- リンク --%>
        <p><a href="<c:url value='/messages/new' />" class="text-info">新規メッセージの投稿</a></p>
        <p><a href="<c:url value='/messages/find' />" class="text-info">メッセージの検索</a></p>

    </c:param>
</c:import>