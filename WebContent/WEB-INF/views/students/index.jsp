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

        <h3 class="text-center mb-4">生徒 一覧</h3>

        <!-- 生徒を一覧表示 -->
        <table class="table">
            <tbody>
                <tr>
                    <th scope="col">学生証番号</th>
                    <th scope="col">学年</th>
                    <th scope="col">クラス</th>
                    <th scope="col">氏名</th>
                    <th scope="col">操作</th>
                </tr>
                <c:forEach var="student" items="${students}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td><c:out value="${student.code}" /></td> <%-- 学生証番号 --%>
                        <td><c:out value="${student.grade}" /></td> <%-- 学年 --%>
                        <td><c:out value="${student.team}" /></td> <%-- クラス --%>
                        <td><c:out value="${student.name}" /></td> <%-- 氏名 --%>
                        <td>
                            <c:choose>
                                <c:when test="${student.delete_flag == 1}"> <%-- delete_flagが1の場合(削除済)の処理 --%>
                                    <span class="badge badge-secondary p-2">削除済み</span>
                                </c:when>
                                <c:otherwise>
                                    <a href="<c:url value='/students/show?id=${student.id}' />" class="btn btn-outline-info">詳細</a> <!-- 詳細(showへのリンク) -->
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination" class="mb-3"> <%-- ページネーション --%>
            (全 ${students_count} 件)<br />
            <c:forEach var="i" begin="1" end="${((students_count - 1) / 15) + 1}" step="1"> <!-- 最大15件表示 -->
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/students/index?page=${i}' />" class="text-info"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

        <p><a href="<c:url value='/students/new' />" class="text-info">新規生徒の登録</a></p>
        <p><a href="<c:url value='/students/find' />" class="text-info">クラス別表示</a></p>
    </c:param>
</c:import>