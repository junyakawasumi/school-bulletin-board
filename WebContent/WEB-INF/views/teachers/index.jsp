<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">

        <%-- フラッシュメッセージ --%>
        <c:if test="${flush != null}">
            <div id="flush_success" class="alert alert-success text-center" role="alert">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>

        <h3 class="text-center mb-4">教職員 一覧</h3>

        <%-- 教職員を一覧表示 --%>
        <table class="table">
            <tbody>
                <tr>
                    <th scope="col">教職員番号</th>
                    <th scope="col">氏名</th>
                    <th scope="col">操作</th>
                </tr>
                <c:forEach var="teacher" items="${teachers}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td><c:out value="${teacher.code}" /></td> <%-- 教職員番号 --%>
                        <td><c:out value="${teacher.name}" /></td> <%-- 氏名 --%>
                        <td>
                            <c:choose>
                                <c:when test="${teacher.delete_flag == 1}"> <%-- delete_flagが1の場合(削除済)の処理 --%>
                                    <span class="badge badge-secondary p-2">削除済み</span>
                                </c:when>
                                <c:otherwise>
                                    <a href="<c:url value='/teachers/show?id=${teacher.id}' />" class="btn btn-outline-info">詳細</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <%-- ページネーション --%>
        <div id="pagination" class="mb-3">
            (全 ${teachers_count} 件)<br />
            <c:forEach var="i" begin="1" end="${((teachers_count - 1) / 15) + 1}" step="1"> <%-- データを最大１５件表示 --%>
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/teachers/index?page=${i}' />" class="text-info"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

        <%-- リンク --%>
        <p><a href="<c:url value='/teachers/new' />" class="text-info">新規教職員の登録</a></p>
        <p><a href="<c:url value='/teachers/find' />" class="text-info">教職員の検索</a></p>

    </c:param>
</c:import>