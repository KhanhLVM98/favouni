<!-- HEAD-->
<%@ include file="/includes/head.jsp" %>
<body class="is-preload">
<!-- Header -->
<%@ include file="/includes/header.jsp" %>
<!-- Main -->
<div id="main">
<!-- One -->
        <section id="one">
        <header class="major">
            <h2>Create a new activity</h2>
            <form action="create-confirm.jsp">
                <div class="row gtr-uniform gtr-50">
                    <div class="col-3 col-12-xsmall">
                        <input type="text" name="actID" id="demo-name" placeholder="Activity ID">
                    </div>
                    <div class="col-6 col-12-xsmall">
                        <input type="text" name="actName" id="demo-name" placeholder="Title">
                    </div>
                    <div class="col-3 col-12-xsmall">
                        <select name="categories" id="demo-category">     
                            <option>Categories</option>
                            <option value="Art">Art</option>
                            <option value="Causes">Causes</option>
                            <option value="Comedy">Comedy</option>
                            <option value="Crafts">Crafts</option>
                            <option value="Dance">Dance</option>
                            <option value="Drinks">Drinks</option>
                            <option value="Film">Film</option>
                            <option value="Fitness">Fitness</option>
                            <option value="Food">Food</option>
                            <option value="Games">Games</option>
                            <option value="Gardening">Gardening</option>
                            <option value="Health">Health</option>
                            <option value="Home">Home</option>
                            <option value="Literature">Literature</option>
                            <option value="Music">Music</option>
                            <option value="Networking">Networking</option>
                            <option value="Other">Other</option>
                            <option value="Party">Party</option>
                            <option value="Religion">Religion</option>
                            <option value="Shopping">Shopping</option>
                            <option value="Sports">Sports</option>
                            <option value="Theater">Theater</option>
                            <option value="Wellness">Wellness</option>
                        </select>
                    </div>                    
                    <div class="col-6 col-12-xsmall">
                          <input type="text" name="actLocation" placeholder="Location"/> <br />
                    </div>
                    <div class="col-3 col-12-xsmall">
                        <input type="time" name="actTime" id="demo-name" placeholder="Time">
                    </div>
                    <div class="col-3 col-12-xsmall">
                        <input type="date" name="actDate" id="demo-name" value="" placeholder="Date">
                    </div>                                                           
                    <div class="col-12 col-12-xsmall">
                        <textarea name="description" id="demo-message" placeholder="Description" rows="3"></textarea>
                    </div>
                    <div class="col-12">
                        <ul class="actions">
                            <li><input type="submit" value="POST" class="primary"></li>
                            <li><input type="reset" value="RESET"></li>
                        </ul>
                    </div>                           
                </div>       
            </form>
        </header>
    </section>

<!-- Two -->
<section id="two">  
<c:if test="${param.success == 1}"> 
    <h2><strong>Success... . See activities you created below!</strong></h2>
</c:if>
    <h2>ACTIVITIES BY YOU</h2>
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
</html>
