<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">

        <h3 class="text-center mb-3">メッセージ 検索ページ</h3>

        <%-- 検索フォーム --%>
        <form method="GET" action="<c:url value='/messages/findresult' />">
            <div class="form-group">
                <label for="meyword">キーワード</label><br />
                <input type="text" name="keyword" size="30" class="form-control" placeholder="メッセージのタイトル・内容・投稿者で検索ができます。" />
            </div>
            <button type="submit" class="btn btn-outline-info mb-4">検索</button>
        </form>

        <%-- 検索結果を表示 --%>
        <c:choose>
            <c:when test="${messages_count != 0}">
                <h3>[<c:out value="${keyword}" />]の検索ヒット数: <c:out value="${messages_count}" /></h3>
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
                                <td><c:out value="${message.teacher.name}" /></td> <%-- 氏名 --%>
                                <td><fmt:formatDate value='${message.message_date}' pattern='yyyy-MM-dd' /></td> <%-- 日付 --%>
                                <td>${message.title}</td> <!-- タイトル -->
                                <td><a href="<c:url value='/messages/show?id=${message.id}' />" class="btn btn-outline-info">詳細</a></td> <%-- 詳細(showへのリンク) --%>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <%-- ページネーション --%>
                <div id="pagination" class="mb-3">
                    （全 ${messages_count} 件）<br />
                    <c:forEach var="i" begin="1" end="${((messages_count - 1) / 15) + 1}" step="1"> <%-- データを最大１５件表示 --%>
                        <c:choose>
                            <c:when test="${i == page}">
                                <c:out value="${i}" />&nbsp;
                            </c:when>
                            <c:otherwise>
                                <a href="<c:url value='/messages/findresult?keyword=${keyword}&page=${i}' />" class="text-info"><c:out value="${i}" /></a>&nbsp;
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </c:when>
            <%-- 検索結果が０だった場合の処理 --%>
            <c:otherwise>
                    <div class="alert alert-warning mb-3 text-center" role="alert">お探しのデータは見つかりませんでした。</div> 
            </c:otherwise>
        </c:choose>
        
        <%-- リンク --%>
        <p><a href="<c:url value='/messages/index' />" class="text-info">メッセージ一覧に戻る</a></p>

    </c:param>
</c:import>
