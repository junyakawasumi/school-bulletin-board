<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <%-- messageがnullではなかった場合の処理 --%>
            <c:when test="${message != null}">
                <h2 class="text-center mb-2">メッセージ 編集ページ</h2>
                <form method="POST" action="<c:url value='/messages/update' />">
                    <c:import url="_form.jsp" />
                </form>
            </c:when>
            <%-- messageがnullだった場合の処理 --%>
            <c:otherwise>
                <div class="alert alert-warning text-center" role="alert">お探しのデータは見つかりませんでした。</div>
            </c:otherwise>
        </c:choose>
        <%--リンク --%>
        <p><a href="<c:url value='/messages/index' />" class="text-info">一覧に戻る</a></p>
    </c:param>
</c:import>