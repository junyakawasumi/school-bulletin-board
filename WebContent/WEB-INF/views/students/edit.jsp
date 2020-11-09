<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <%-- studentがnullではなかった場合の処理 --%>
            <c:when test="${student != null}">
                <h2 class="text-center mb-3">${student.name} の生徒情報 編集ページ</h2>
                <small class="text-center mb-3 form-text text-muted">※パスワードは変更する場合のみ入力してください。</small>
                <%-- フォーム --%>
                <form method="POST" action="<c:url value='/students/update' />">
                    <c:import url="_form.jsp" />
                </form>
                <%-- 削除 --%>
                <p><a href="#" onclick="confirmDestroy();" class="text-info">この生徒情報を削除する</a></p>
                <form method="POST" action="<c:url value='/students/destroy' />">
                    <input type="hidden" name="_token" value="${_token}" /> <%-- セッションID --%>
                </form>
                <%-- JavaScript --%>
                <script> 
                    function confirmDestroy() {
                        if(confirm("本当に削除してよろしいですか？")) {
                            document.forms[1].submit();
                        }
                    }
                </script>
            </c:when>
            <%-- studentがnullだった場合の処理 --%>
            <c:otherwise>
                <div class="alert alert-warning text-center" role="alert">お探しのデータは見つかりませんでした。</div>
            </c:otherwise>
        </c:choose>
        <%-- リンク --%>
        <p><a href="<c:url value='/students/index' />" class="text-info">生徒一覧に戻る</a></p>
    </c:param>
</c:import>