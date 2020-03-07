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
        <h3><strong>Verify Account, Please!</strong></h3>
        <form action="verify" method="post" style="color:#3eb08f">
            <div class="row gtr-uniform gtr-50">
                <div class="col-4 col-12-xsmall">                               
                    <label>Username: </label>
                </div>                           
                <div class="col-8 col-12-xsmall">                               
                    <input type="text" name="username" placeholder="Username">
                </div>
                <div class="col-4 col-12-xsmall">                               
                    <label>Password: </label>
                </div>
                <div class="col-8 col-12-xsmall">
                    <input type="password" name="userpass" placeholder="********">
                </div>                            
                <div class="col-12">
                    <ul class="actions">
                        <li><input type="submit" value="DELETE" class="primary"></li>
                    </ul>
                </div>                           
            </div>
        </form>
        <ul class="actions">
            <li><input type="submit" value="BACK" onclick="javascript:history.go(-1)"></li>
        </ul>
    </header>
</section>                                        
</div>
<%@ include file="/includes/footer.jsp" %>
</html>
