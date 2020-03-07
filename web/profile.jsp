<!-- HEAD-->
<%@ include file="/includes/head.jsp" %>
<body class="is-preload">
<!-- Header -->
<%@ include file="/includes/header.jsp" %>
<!-- Main -->
<div id="main">
<section>
<header class="major">                    
    <div class="row">
    <c:forEach items="${us.allUser}" var="uf">
        <c:if test="${uf.username==uff.username}">
            <div class="col-6 col-12-xsmall">   
                <h2>PROFILE</h2>
                <a href="#" class="image" style="width: 100%"><img src="images/avatar.jpg" alt="" /></a>
                <h3><strong>${uf.fullname}</strong></h3>
                <!--<ul>                                 
                    <li>100 friends</li>
                    <li>10 activities</li>
                    <li>joined 50 activities</li>

                </ul>-->
                <div class="col-12 col-12-small">
                    <strong>Introduction: </strong><blockquote>${uf.bio}</blockquote>                                               
                </div>
            </div>
            <div class="col-6 col-12-xsmall">
                <ul class="alt"> 
                    <li><strong>Full name: </strong>&nbsp;&nbsp; ${uf.fullname}</li>
                    <li><strong>Date of birth: </strong>&nbsp;&nbsp; ${uf.dob}</li>
                    <li><strong>Gender: </strong>&nbsp;&nbsp; ${uf.gender}</li>         
                    <li><strong>Email: </strong>&nbsp;&nbsp; ${uf.email}</li>
                    <li><strong>Phone: </strong>&nbsp;&nbsp; ${uf.phone}</li>
                    <li><strong>Address: </strong>&nbsp;&nbsp; ${uf.userLocation}</li>
                </ul>
            </div>
        </c:if>       
    </c:forEach>
    </div>
    <c:if test="${uff.username==u.username}">
        <ul class="actions fit">
            <li><a href="edit?username=${u.username}" class="button small primary fit">Edit Profile</a></li>
            <li><a href="changepass" class="button small primary fit">Change Password</a></li>
            <li><a href="listfriend?username=${u.username}" class="button small primary fit">Friends</a></li>
            <li><a href="manage" class="button small primary fit">Manage Activities</a></li>
        </ul>
            
</header>
</section>
<!-- Two -->
<section id="two">
    <div class="row">
        <h2><strong>TIMELINE</strong></h2>
    <c:forEach items="${act.allActivity}" var="a">
        <c:if test="${a.username==u.username}">
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
    </c:if>
</section>
</div>
<%@ include file="/includes/footer.jsp" %>
</body>
</html>


