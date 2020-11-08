<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">

        <h3 class="text-center mb-2">教職員検索ページ</h3>

        <!-- 検索フォーム -->
        <form method="GET" action="<c:url value='/teachers/findresult' />">
            <div class="form-group">
                <label for="meyword"></label><br />
                <input type="text" name="keyword" size="30" class="form-control" placeholder="氏名で検索ができます。"/>
            </div>
            <button type="submit" class="btn btn-outline-info mb-4">検索</button>
        </form>

        <!-- 検索結果を表示 -->
        <c:choose>
            <c:when test="${teachers_count != 0}">
                <h2>[<c:out value="${keyword}" />]の検索ヒット数: <c:out value="${teachers_count}" /></h2>
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
                                            [削除済み]
                                        </c:when>
                                        <c:otherwise>
                                            <a href="<c:url value='/teachers/show?id=${teacher.id}' />" class="btn btn-outline-info">詳細</a> <!-- 詳細(showへのリンク) -->
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
                    <c:forEach var="i" begin="1" end="${((teachers_count - 1) / 10) + 1}" step="1"> <!-- 教職員データを最大10件表示 -->
                        <c:choose>
                            <c:when test="${i == page}">
                                <c:out value="${i}" />&nbsp;
                            </c:when>
                            <c:otherwise>
                                <a href="<c:url value='/teachers/findresult?keyword=${keyword}&page=${i}' />" class="text-info"><c:out value="${i}" /></a>&nbsp;
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
                <br><br>

                <h2><c:out value="${keyword}" />先生の最新メッセージ</h2>
                <table class="table">
                    <tbody>
                        <tr>
                            <th scope="col">氏名</th>
                            <th scope="col">日付</th>
                            <th scope="col">タイトル</th>
                            <th scope="col">操作</th>
                        </tr>
                        <c:forEach var="message" items="${messages}" varStatus="status">
                            <tr class="row${status.count % 2}">
                                <td><c:out value="${message.teacher.name}" /></td> <!-- 氏名 -->
                                <td><fmt:formatDate value='${message.message_date}' pattern='yyyy-MM-dd' /></td> <!-- 日付 -->
                                <td>${message.title}</td> <!-- タイトル -->
                                <td><a href="<c:url value='/messages/show?id=${message.id}' />" class="btn btn-outline-info">詳細</a></td> <!-- 詳細(showへのリンク) -->
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                    <div class="alert alert-warning mb-3 text-center" role="alert">お探しのデータは見つかりませんでした。</div> <!-- 検索結果が0だった場合 -->
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value='/teachers/index' />" class="text-info">教職員一覧に戻る</a></p>
    </c:param>
</c:import>
