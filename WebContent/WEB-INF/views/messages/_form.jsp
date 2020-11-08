<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     <%-- フラッシュメッセージ --%>
    <c:if test="${errors != null}">
        <div class="alert alert-danger" role="alert">
            入力内容にエラーがあります。<br />
            <c:forEach var="error" items="${errors}">
                ・<c:out value="${error}" /><br />
            </c:forEach>
        </div>
    </c:if>

    <%-- データ入力部分 --%>
    <div class="form-group">
        <label for="message_date">日付</label><br />
        <input type="date" name="message_date" class="form-control" value="<fmt:formatDate value='${message.message_date}' pattern='yyyy-MM-dd' />" />
    </div>
    <div class="form-group">
        <label for="name">氏名</label><br />
        <c:out value="${sessionScope.login_teacher.name}" />
        <span>先生</span>
    </div>
    <div class="form-group">
        <label for="title">タイトル</label><br />
        <input type="text" name="title" class="form-control" value="${message.title}" />
    </div>
    <div class="form-group">
        <label for="content">内容</label><br />
        <textarea name="content" rows="10" class="form-control">${message.content}</textarea>
    </div>
    <div class="form-group">
        <label for="open_range">公開範囲</label><br />
        <select name="open_range" class="form-control">
            <option value="0"<c:if test="${message.open_range == 0}"> selected</c:if>>全体</option>
            <option value="1"<c:if test="${message.open_range == 1}"> selected</c:if>>教職員のみ</option>
        </select>
    </div>

    <input type="hidden" name="_token" value="${_token}" />
    <button type="submit" class="btn btn-outline-info mb-3">投稿</button>