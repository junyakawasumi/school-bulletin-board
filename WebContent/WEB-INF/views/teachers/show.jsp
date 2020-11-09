<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
        
            <%-- teacherがnullではなかった場合の処理 --%>
            <c:when test="${teacher != null}"> 
            
                <h3 class="text-center mb-4">${teacher.name} 先生の教職員情報 詳細ページ</h3>

                <%-- データを一件表示 --%>
                <table class="table">
                    <tbody>
                        <tr>
                            <th scope="row">教職員番号</th>
                            <td><c:out value="${teacher.code}" /></td>
                        </tr>
                        <tr>
                            <th scope="row">氏名</th>
                            <td><c:out value="${teacher.name}" /></td>
                        </tr>
                        <tr>
                            <th scope="row">所属</th>
                            <td>
                                <c:choose>
                                    <c:when test="${teacher.admin_flag == 1}">教務部</c:when>
                                    <c:otherwise>一般</c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">登録日時</th>
                            <td>
                                <fmt:formatDate value="${teacher.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">更新日時</th>
                            <td>
                                <fmt:formatDate value="${teacher.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                <p><a href="<c:url value='/teachers/edit?id=${teacher.id}' />" class="text-info">この教職員情報を編集する</a></p>
            </c:when>
            <%-- teacherがnullだった場合の処理 --%>
            <c:otherwise>
                <div class="alert alert-warning text-center" role="alert">お探しのデータは見つかりませんでした。</div>
            </c:otherwise>
        </c:choose>

        <%-- リンク --%>
        <p><a href="<c:url value='/teachers/find' />" class="text-info">教職員検索に戻る</a></p>
        <p><a href="<c:url value='/teachers/index' />" class="text-info">教職員一覧に戻る</a></p>
        
    </c:param>
</c:import>