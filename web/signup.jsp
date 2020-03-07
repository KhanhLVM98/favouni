<!-- HEAD-->
<%@ include file="/includes/head.jsp" %>
<body class="is-preload">

<!-- Header -->
    <header id="header">
        <div class="inner">
            <h1>SIGN UP</h1><br>
            <form action="signup" method="POST" style="color: #49bf9d">
                <input type="text" placeholder="Fullname" name="fullname"><br> 
                <input type="text" placeholder="Username" name="username"><br>
                <c:if test="${param.failure==0}"><p><strong>Error... . username is existed!</strong></p></c:if>
                <input type="password" placeholder="Password" name="userpass"><br>
                <c:choose>
                    <c:when test="${param.failure==1}"><p><strong>Error... . password less 8 character</strong></p></c:when>
                    <c:otherwise></c:otherwise>
                </c:choose>
                <div class="row gtr-uniform gtr-50">
                    <div class="col-4 col-12-small">
                        Date of birth :
                    </div>
                    <div class="col-8 col-12-small">
                        <input type="date" name="dob"/>
                    </div>
                </div>
                <br>
                <div class="row gtr-uniform gtr-50">
                    <div class="col-4 col-12-small">
                        Gender :
                    </div>
                    <div class="col-4 col-12-small">
                        <input type="radio" id="demo-priority-low" name="gender" value="M" checked>
                        <label for="demo-priority-low">Male</label>
                    </div>
                    <div class="col-4 col-12-small">
                        <input type="radio" id="demo-priority-normal" name="gender" value="F">
                        <label for="demo-priority-normal">Female</label>
                    </div>
                </div>               
                <br>
                <div class="row gtr-uniform gtr-50">
                    <div class="col-6 col-12-small">
                        
                    </div>
                <ul class="actions fit">
                    <li><a href="signin" class="button small fit">Sign in</a></li>
                    <li><input type="submit" class="button primary small" value="Sign Up"></li>
                </ul>
            </form>
        </div>

    </header>

<!-- Main -->
<div id="main">
    <section id="one">
            <header class="major">
                <h3><strong>FavoUni</strong> helps you connect and join favourite activities in your university.</h3>
            </header>
            
            <section>
                <div class="box alt">
                        <div class="row gtr-50 gtr-uniform">                               
                                <div class="col-4"><span class="image fit"><img src="images/thumbs/01.jpg" alt="" /></span></div>
                                <div class="col-4"><span class="image fit"><img src="images/thumbs/02.jpg" alt="" /></span></div>
                                <div class="col-4"><span class="image fit"><img src="images/thumbs/03.jpg" alt="" /></span></div>
                                <div class="col-12"><span class="image fit"><img src="images/thumbs/cover.jpg" alt="" /></span></div>
                        </div>
                </div>
							
            </section>
    </section>
</div>	
<%@ include file="/includes/footer.jsp" %>
</body>
</html>