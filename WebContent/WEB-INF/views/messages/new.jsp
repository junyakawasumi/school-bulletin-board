<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h3 class="text-center mb-3">新規メッセージ投稿ページ</h3>
        <%-- フォーム --%>
        <form method="POST" action="<c:url value='/messages/create' />">
            <c:import url="_form.jsp" />
        </form>
        <%-- リンク --%>
        <p><a href="<c:url value='/messages/index' />" class="text-info">メッセージ一覧に戻る</a></p>
    </c:param>
</c:import>