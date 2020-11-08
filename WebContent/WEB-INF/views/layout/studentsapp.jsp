<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>●●高等学校掲示板</title>
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">

            <!-- ナビゲーション(ヘッター) -->
            <nav class="navbar navbar-expand-lg navbar-light p-4 my-3 bg-info text-dark">
                <a class="navbar-brand" href="<c:url value='/stoppage' />">●●高等学校掲示板</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <!-- アプリ名 -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav ml-auto">
                    <c:if test="${sessionScope.login_student != null}">
                        <li class="nav-item">
                            <a class="nav-link disabled text-white"><c:out value="${sessionScope.login_student.name}" />&nbsp;さん</a> <!-- ユーザーネーム -->
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link text-dark" href="<c:url value='/slogout' />">ログアウト</a> <!-- ログアウト -->
                        </li>
                    </c:if>
                </ul>
                </div>
            </nav>

            <!-- コンテンツ -->
            <div id="content">
                ${param.content}
            </div>

            <!-- フッター -->
            <div id="footer" class="text-center mb-4">
                by Junya Kawasumi.
            </div>
        </div>
    </body>
</html>