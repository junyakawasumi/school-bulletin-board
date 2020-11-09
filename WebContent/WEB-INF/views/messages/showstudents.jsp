<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/studentsapp.jsp">
    <c:param name="content">
        <c:choose>
            <%-- messageがnullではなかった場合の処理 --%>
            <c:when test="${message != null}">
            
                <h3 class="text-center mb-4">メッセージ 詳細ページ</h3>

                <%-- データを１件表示 --%>
                <table class="table">
                    <tbody>
                        <tr>
                            <th scope="row">氏名</th>
                            <td><c:out value="${message.teacher.name}" /> 先生</td>
                        </tr>
                        <tr>
                            <th scope="row">日付</th>
                            <td><fmt:formatDate value="${message.message_date}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                        <tr>
                            <th scope="row">内容</th>
                            <td>
                                <pre><c:out value="${message.content}" /></pre>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">登録日時</th>
                            <td>
                                <fmt:formatDate value="${message.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">更新日時</th>
                            <td>
                                <fmt:formatDate value="${message.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </c:when>
            <%-- messageがnullだった場合の処理 --%>
            <c:otherwise>
                <div class="alert alert-warning text-center" role="alert">お探しのデータは見つかりませんでした。</div>
            </c:otherwise>
        </c:choose>

        <%-- リンク --%>
        <p><a href="<c:url value="/stoppage" />" class="text-info">トップページに戻る</a></p>

    </c:param>
</c:import>