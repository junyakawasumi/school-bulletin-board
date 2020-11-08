<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%-- 入力内容のエラーチェック --%>
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
        <label for="code">教職員番号</label><br />
        <input type="text" name="code" class="form-control" value="${teacher.code}" placeholder="ex: 123456" />
    </div>
    <div class="form-group">
        <label for="name">氏名</label><br />
        <input type="text" name="name" class="form-control" value="${teacher.name}" placeholder="ex: 山田 太郎" />
    </div>
    <div class="form-group">
        <label for="password">パスワード</label><br />
        <input type="password" name="password" class="form-control" />
    </div>
    <div class="form-group">
        <label for="admin_flag">所属</label><br />
        <select name="admin_flag" class="form-control">
            <option value="0"<c:if test="${teacher.admin_flag == 0}"> selected</c:if>>一般</option>
            <option value="1"<c:if test="${teacher.admin_flag == 1}"></c:if>>教務部</option>
        </select>
    </div>

    <input type="hidden" name="_token" value="${_token}" /> <%-- セッションID --%>
    <button type="submit" class="btn btn-outline-info mb-3">登録</button>