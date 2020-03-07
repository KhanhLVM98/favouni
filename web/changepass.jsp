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
        <h2>CHANGE PASSWORD</h2>
        <form action="changepass" method="post" style="color:#3eb08f">
            <div class="row gtr-uniform gtr-50">
                <div class="col-4 col-12-xsmall">                               
                    <label>Current Password: </label>
                </div>
                <div class="col-8 col-12-xsmall">
                    <input type="password" name="userpass" placeholder="********">
                    <a href="#">Forgot password?</a>
                </div> 
                <div class="col-4 col-12-xsmall">                               
                    <label>New Password: </label>
                </div>
                <div class="col-8 col-12-xsmall">
                    <input type="password" name="newpass" placeholder="********">
                    <c:if test="${param.failure==1}"><p><strong>Error... . password less 8 character</strong></p></c:if>
                </div>

                <div class="col-4 col-12-xsmall">                               
                    <label>Confirm Password: </label>
                </div>
                <div class="col-8 col-12-xsmall">
                    <input type="password" name="confirmpass" placeholder="********">
                </div>                            
                <div class="col-12">
                    <ul class="actions">
                        <li><input type="submit" value="CHANGE" class="primary"></li>
                        <li><a href="profile" class="button">Back to profile</a></li>
                    </ul>
                </div>                           
            </div>
        </form>
    </header>
</section>                                        
</div>
<%@ include file="/includes/footer.jsp" %>
</body>
</html>
