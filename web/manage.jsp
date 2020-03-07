<!-- HEAD-->
<%@ include file="/includes/head.jsp" %>
<body class="is-preload">
<!-- Header -->
<%@ include file="/includes/header.jsp" %>
<!-- Main -->
<div id="main">
    <section>  
        <c:if test="${param.success == 1}"> 
            <h2><strong>Success... . See activities you created below!</strong></h2>
        </c:if>
            <h2>MANAGE ACTIVITIES</h2>
                    <div class="row">
                        <c:forEach items="${act.allActivity}" var="a">
                            <c:if test="${a.username==u.username}">
                        <article class="col-6 col-12-xsmall work-item">
                            <h2><strong>${a.actID} . ${a.actName}</strong></h2>
                                <a href="images/fulls/cover.jpg" class="image fit thumb"><img src="images/thumbs/cover.jpg" alt="" /></a>

                            <div class="table-wrapper">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Location</th>
                                                <th>Time</th>
                                                <th>Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                                <tr>   
                                                    <td>${a.actLocation}</td>
                                                    <td>${a.actTime}</td>
                                                    <td>${a.actDate}</td>                                                                                                                                     
                                                </tr>
                                        </tbody>
                                        <thead>
                                            <tr>
                                                <th>Category</th>
                                                <th>Description</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                                <tr>
                                                    <td>${a.categories}</td>
                                                    <td>${a.description}</td>	
                                                    <td></td>
                                                </tr>
                                        </tbody>
                                    </table>
                            </div>
                            <ul class="actions fit">
                                <li><a href="update?actID=${a.actID}" class="button primary fit">Update</a></li>
                                <li><a href="delete?actID=${a.actID}" class="button fit">Delete</a></li>
                                <li><a href="detail?actID=${a.actID}" class="button fit">Details</a></li>
                            </ul>
                            <hr>
                        </article>
                                </c:if>
                        </c:forEach>
                    </div>


        </section>
        </div>
<%@ include file="/includes/footer.jsp" %>
</body>
</html>
