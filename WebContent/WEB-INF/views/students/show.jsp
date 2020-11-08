<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${student != null}"> <%-- "student"がnullではなかった場合の処理 --%>
                <h3 class="text-center mb-4">${student.name} の生徒情報 詳細ページ</h3>

                <table class="table">
                    <tbody>
                        <tr>
                            <th scope="row">学生証番号</th>
                            <td><c:out value="${student.code}" /></td>
                        </tr>
                        <tr>
                            <th scope="row">学年</th>
                            <td><c:out value="${student.grade}" /></td>
                        </tr>
                        <tr>
                            <th scope="row">クラス</th>
                            <td><c:out value="${student.team}" /></td>
                        </tr>
                        <tr>
                            <th scope="row">氏名</th>
                            <td><c:out value="${student.name}" /></td>
                        </tr>
                        <tr>
                            <th scope="row">登録日時</th>
                            <td>
                                <fmt:formatDate value="${student.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">更新日時</th>
                            <td>
                                <fmt:formatDate value="${student.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                    </tbody>
                </table>

                <p><a href="<c:url value='/students/edit?id=${student.id}' />" class="text-info">情報を編集する</a></p>
            </c:when>
            <c:otherwise>
                <div class="alert alert-warning text-center" role="alert">お探しのデータは見つかりませんでした。</div>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value='/students/find' />" class="text-info">クラス別表示に戻る</a></p>
        <p><a href="<c:url value='/students/index' />" class="text-info">生徒一覧に戻る</a></p>

    </c:param>
</c:import>