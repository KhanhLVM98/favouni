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
        <c:if test="${param.error == 0}"> 
            <h2><strong>Error...! Check again!</strong></h2>
        </c:if>
        <h2>DELETE ACTIVITY</h2>
        <form action="delete" method="post" style="color:#3eb08f">
            <div class="row gtr-uniform gtr-50">
                <div class="col-6 col-12-xsmall">
                    <input type="text" name="actName" id="demo-name" value="${ad.actName}">
                </div>
                <div class="col-3 col-12-xsmall">
                    <input type="time" name="actTime" id="demo-name" value="${ad.actTime}">
                </div>
                <div class="col-3 col-12-xsmall">
                    <input type="date" name="actDate" id="demo-name" value="${ad.actDate}">
                </div>
                <div class="col-6 col-12-xsmall">
                      <input type="text" name="actLocation" value="${ad.actLocation}"/> <br />
                </div>                        
                <div class="col-6 col-12-xsmall">
                    <select name="categories" id="demo-category">   
                        <option>${ad.categories}</option>  
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
                <div class="col-12">
                    <textarea name="description" id="demo-message" rows="3">${ad.description}</textarea>
                </div>                           
                <div class="col-12">
                    <ul class="actions fit">
                        <li><input type="submit" value="DELETE" class="primary"></li>
                        <li><a href="manage"class="button">CANCEL</a></li>
                    </ul>
                </div>                           
            </div>
        </form>
    </header>
</section>                                        
</div>
<%@ include file="/includes/footer.jsp" %>
</html>
