<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>●●高等学校掲示板</title>
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
        
            <%-- ナビゲーション --%>
            <nav class="navbar navbar-expand-lg navbar-light p-4 my-3 bg-info">
                <a class="navbar-brand" href="<c:url value='/' />">●●高等学校掲示板</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%-- アプリ名 --%>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <c:if test="${sessionScope.login_teacher != null}">
                        <c:if test="${sessionScope.login_teacher.admin_flag == 1}"> <%-- 管理者にのみ表示 --%>
           
                            <%-- 教職員管理 --%>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-dark" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  教職員管理
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                  <a class="dropdown-item" href="<c:url value='/teachers/index' />">・一覧表示</a>
                                  <a class="dropdown-item" href="<c:url value='/teachers/find' />">・検索</a>
                                  <a class="dropdown-item" href="<c:url value='/teachers/new' />">・新規登録</a>
                                </div>
                            </li>
                            
                            <%-- 生徒管理 --%>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-dark" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  生徒管理
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                  <a class="dropdown-item" href="<c:url value='/students/index' />">・一覧表示</a>
                                  <a class="dropdown-item" href="<c:url value='/students/find' />">・クラス別表示</a>
                                  <a class="dropdown-item" href="<c:url value='/students/new' />">・新規登録</a>
                                </div>
                            </li>
                            
                        </c:if>
                        
                        <%-- メッセージ管理 --%>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-dark" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              メッセージ管理
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="<c:url value='/messages/index' />">・一覧表示</a>
                                <a class="dropdown-item" href="<c:url value='/messages/find' />">・検索</a>
                                <a class="dropdown-item" href="<c:url value='/messages/new' />">・新規メッセージの投稿</a>
                            </div>
                        </li>
                        
                    </c:if>
                </ul>
                
                <%-- ログインユーザー名&ログアウトリンク --%>
                <ul class="navbar-nav">
                    <c:if test="${sessionScope.login_teacher != null}">
                        <li class="nav-item">
                            <a class="nav-link disabled text-white"><c:out value="${sessionScope.login_teacher.name}" />&nbsp;先生</a> <!-- ログインユーザー -->
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link text-dark" href="<c:url value='/tlogout' />">ログアウト</a> <!-- ログアウト -->
                        </li>
                    </c:if>
                </ul>
                
                </div>
            </nav>

            <%-- コンテンツ --%>
            <div id="content">
                ${param.content}
            </div>

            <%-- フッター --%>
            <div id="footer" class="text-center mb-4">
                by Junya Kawasumi.
            </div>
        </div>
    </body>
</html>