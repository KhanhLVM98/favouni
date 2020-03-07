<!-- HEAD-->
<%@ include file="/includes/head.jsp" %>
<body class="is-preload">
<!-- Header -->
<%@ include file="/includes/header.jsp" %>                        
<!-- Main -->
<div id="main">				
<!-- One -->
<section id="one">
    <h2>ACTIVITY DETAILS</h2>
    <div class="row">    
    <c:forEach items="${act.allActivity}" var="a">
        <c:if test="${a.actID==adt.actID}">
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
                <li><input type="submit" value="BACK" onclick="javascript:history.go(-1)"></li>
            </ul>
            <c:choose>
                <c:when test="${act.getAllJoin() != null}">
                    <div class="table-wrapper">
                    <table>
                        <thead>
                            <tr>
                                <th>Action</th>
                                <th>Member</th>
                                <th>Join date</th>                                                                      
                            </tr>
                        </thead>
                    <c:forEach items="${act.getAllJoin()}" var="j">
                        <c:if test="${act.getJoin(a.actID, j.username)}">
                        <tbody>
                            <tr>
                                <td>
                                    <c:choose>                                        
                                        <c:when test="${act.getActivity(a.actID, u.username) && u.username!=j.username}"><a href="delmember?username=${j.username}" class="button small primary">Delete</a></c:when>
                                        <c:when test="${act.getActivity(a.actID, u.username) && u.username==j.username}"><a href="profile?username=${j.username}" class="button small primary">Author</a></c:when>
                                        <c:otherwise><a href="profile?username=${j.username}" class="button small primary">Profile Details</a></c:otherwise>                      
                                    </c:choose>
                                </td> 
                                <td>${us.getUser(j.username).fullname}</td>
                                <td>${j.joinDate}</td>                                              										
                            </tr>
                        </tbody>
                        </c:if>    
                    </c:forEach>
                    </table>
                    </div>
                </c:when>
                <c:otherwise><p>List of member is empty</p></c:otherwise> 
            </c:choose> 
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
</html>
