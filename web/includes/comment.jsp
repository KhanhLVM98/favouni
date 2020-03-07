<form action="comment" method="POST">
    <div class="row">                 
        <div class="col-8 col-12-small">
            <textarea id="demo-message" placeholder="Enter your comment" rows="2" name="content"></textarea>
        </div>
        <div class="col-4 col-12-small">
            <input type="radio" id="demo-priority-low" name="actID" value="${a.actID}" checked>
            <input type="submit" value="Post" class="button primary"/> 
        </div>                                                                    
    </div>  
</form>
<br>
<div class="row" style=" margin: 0;padding: 5% 3% 0 0; border: 1px solid #a2a2a2; border-radius: 5px;">
    <br>
    <c:choose>
        <c:when test="${cm.getAllComment(a.actID) != null}">
            <c:forEach items="${cm.getAllComment(a.actID)}" var="cmt">
                <div class="col-2 col-12-small">                                                                  
                    <a href="#" class="image avatar"><img src="images/avatar.jpg" alt=""/></a>
                </div>  
                <div class="col-4 col-12-small">
                    <h3><strong><a href="profile?username=${u.username}">${us.getUser(cmt.username).fullname}</a></strong></h3>
                    <ul>
                        <li>${cmt.dateComment}</li>                                                                        
                    </ul>
                </div>
                <div class="col-6 col-12-small">               
                    <blockquote>${cmt.content}</blockquote>                                                                             
                </div> 
            </c:forEach>                       
        </c:when>
        <c:otherwise></c:otherwise> 
    </c:choose> 
</div>
