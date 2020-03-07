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
        <h2>EDIT PROFILE</h2>
        <form action="edit" method="post" style="color:#3eb08f">

            <div class="row gtr-uniform gtr-50">
                <div class="col-2 col-12-small">
                    <label>Full name :</label>
                </div>
                <div class="col-10 col-12-small">
                    <input type="text" name="fullname" id="demo-name" value="${ue.fullname}">
                </div>                                   
            </div>                         
            <br> 
            <div class="row gtr-uniform gtr-50">  
                <div class="col-2 col-12-small">
                    <label>Date of birth:</label>
                </div>
                <div class="col-4 col-12-small">
                    <input type="date" name="dob" id="demo-name" value="${ue.dob}" placeholder="update information">
                </div>
                <div class="col-2 col-12-small">
                    <label>Gender :</label>
                </div>
                <div class="col-2 col-12-small">
                    <input type="radio" id="demo-priority-low" name="gender" value="M" ${ue.gender.equals("Male") ? " checked='checked' ":" "}>
                    <label for="demo-priority-low">Male</label>
                </div>
                <div class="col-2 col-12-small">
                    <input type="radio" id="demo-priority-normal" name="gender" value="F" ${!ue.gender.equals("Male") ? " checked='checked'" :" "}>
                    <label for="demo-priority-normal">Female</label>
                </div>                                                               
            </div> 
            <br> 
            <div class="row gtr-uniform gtr-50">
                <div class="col-2 col-12-small">
                    <label>Email :</label>
                </div>
                <div class="col-4 col-12-small">
                    <input type="text" name="email" id="demo-name" value="${ue.email}" placeholder="update information">
                </div>
                <div class="col-2 col-12-small">
                    <label>Phone :</label>
                </div>
                <div class="col-4 col-12-small">
                    <input type="text" name="phone" id="demo-name" value="${ue.phone}" placeholder="update information">
                </div>
            </div>                         
            <br>
            <div class="row gtr-uniform gtr-50">
                <div class="col-2 col-12-small">
                    <label>Address :</label>
                </div>
                <div class="col-10 col-12-small">
                    <input type="text" name="userLocation" id="demo-name" value="${ue.userLocation}" placeholder="update information">
                </div>                                   
            </div>                         
            <br>
            <div class="row gtr-uniform gtr-50">                                                                        
                <div class="col-2 col-12-small">
                    <label>Introduction :</label>
                </div>                            
                <div class="col-10 col-12-small">
                    <textarea name="bio" id="demo-message" placeholder="update information" rows="2">${ue.bio}</textarea>
                </div>
            </div>
            <br>
            <div class="col-12">
                <ul class="actions">
                    <li><input type="submit" value="SAVE" class="primary"></li>
                    <li><a href="profile.jsp?username=${u.username}" class="button">Back to profile</a></li>
                </ul>
            </div>                           
        </form>
    </header>
</section>                                        
</div>
<%@ include file="/includes/footer.jsp" %>
</html>
