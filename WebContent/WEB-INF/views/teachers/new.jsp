<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h3 class="text-center mb-3">新規教職員登録ページ</h3>
        <form method="POST" action="<c:url value='/teachers/create' />">
            <c:import url="_form.jsp" />
        </form>
        <p><a href="<c:url value='/teachers/index' />" class="text-info">教職員一覧に戻る</a></p>
    </c:param>
</c:import>