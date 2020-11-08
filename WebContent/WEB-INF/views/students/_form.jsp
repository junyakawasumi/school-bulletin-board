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
        <label for="code">学生証番号</label><br />
        <input type="text" name="code" class="form-control" value="${student.code}" placeholder="ex: 010101" />
    </div>
    <div class="form-group">
        <label for="name">氏名</label><br />
        <input type="text" name="name" class="form-control" value="${student.name}" placeholder="ex: 山田 太郎" />
    </div>
    <div class="form-group">
        <label for="grade">学年</label><br />
        <select name="grade" class="form-control">
            <option value="1"<c:if test="${student.grade == 1}"> selected</c:if>>1</option>
            <option value="2"<c:if test="${student.grade == 2}"></c:if>>2</option>
            <option value="3"<c:if test="${student.grade == 3}"></c:if>>3</option>
        </select>
    </div>
    <div class="form-group">
        <label for="team">クラス</label><br />
        <select name="team" class="form-control">
            <option value="1"<c:if test="${student.team == 1}"> selected</c:if>>1</option>
            <option value="2"<c:if test="${student.team == 2}"></c:if>>2</option>
            <option value="3"<c:if test="${student.team == 3}"></c:if>>3</option>
        </select>
    </div>
    <div class="form-group">
        <label for="password">パスワード</label><br />
        <input type="password" name="password" class="form-control" />
    </div>

    <input type="hidden" name="_token" value="${_token}" /> <%-- セッションID --%>
    <button type="submit" class="btn btn-outline-info mb-3">登録</button>