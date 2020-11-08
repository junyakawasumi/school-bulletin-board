<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/studentsapp.jsp">
    <c:param name="content">

        <!-- フラッシュメッセージ -->
        <c:if test="${flush != null}">
            <div class="alert alert-danger" role="alert">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>

        <h3 class="text-center my-4">生徒用ログインページ</h3>

        <!-- エラー内容 -->
        <c:if test="${hasError}">
            <div class="alert alert-danger text-center" role="alert">
                学生証番号かパスワードが間違っています。
            </div>
        </c:if>

        <!-- ログインフォーム -->
        <div class="row justify-content-center align-items-center h-100">
            <div class="col col-sm-6">
                <form method="POST" action="<c:url value='/slogin' />">
                    <div class="form-group">
                        <label for="code">学生証番号</label><br />
                        <input type="text" name="code" class="form-control" value="${code}" placeholder="ex: 010101" />
                    </div>
                    <div class="form-group">
                        <label for="password">パスワード</label><br />
                        <input type="password" name="password" class="form-control mb-4" />
                    </div>
                    <input type="hidden" name="_token" value="${_token}" />
                    <button type="submit" class="btn btn-outline-info mb-3 form-control">ログイン</button>
                </form>
            </div>
        </div>

        <!-- 教職員用ログインリンク -->
        <p class="text-center"><a href="<c:url value='/tlogin' />" class="text-info">教職員用ログインはこちら</a></p>

    </c:param>
</c:import>
