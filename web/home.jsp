<!-- HEAD -->
<%@ include file="/includes/head.jsp" %>
<body class="is-preload">   
<!-- Header -->
<%@ include file="/includes/header.jsp" %>
<!-- Main -->
<div id="main">
<section>
    <div class="row">
    <c:forEach items="${act.allActivity}" var="a">
        <c:if test="${a.username!=u.username}">
        <article class="col-12-small col-12-xsmall work-item">           
        <!-- Post -->
        <%@ include file="/includes/post.jsp" %>
            <ul class="actions fit">               
                <c:choose>
                    <c:when test="${act.getLike(a.actID, u.username)}"><li><a href="dislike?actID=${a.actID}" class="button primary fit">Liked</a></li></c:when>
                    <c:otherwise><li><a href="like?actID=${a.actID}" class="button fit">Like</a></li></c:otherwise>                        
                </c:choose>      
                <c:choose>
                    <c:when test="${act.getJoin(a.actID, u.username)}"><li><a href="unjoin?actID=${a.actID}" class="button primary fit">Joined</a></li></c:when>
                    <c:when test="${act.getActivity(a.actID, u.username)}"><li><a href="manage" class="button primary fit">Manage Activity</a></li></c:when>
                    <c:otherwise><li><a href="join?actID=${a.actID}" class="button fit">Join</a></li></c:otherwise>                        
                </c:choose>
                <li><a href="detail?actID=${a.actID}" class="button fit">Details</a></li>
            </ul>            
            <hr>
            <!-- Comment -->
            <%@ include file="/includes/comment.jsp" %>
        </article>
        </c:if>
        </c:forEach>       
    </div>                                         
</section>
</div>
<%@ include file="/includes/footer.jsp" %>
</body>
</html>
