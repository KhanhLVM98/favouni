<!-- HEAD-->
<%@ include file="/includes/head.jsp" %>
<body class="is-preload">
<!-- Header -->
<header id="header">
    <div class="inner">
        <h1>SIGN IN</h1><br>
        <form action="signin" method="POST" style="color: #49bf9d">
            Username :
            <input type="text" name="username"><br>    
            Password :
            <input type="password" name="userpass"><br>
            <a href="#">Forgot username or password?</a><br><br>
            <ul class="actions fit">
                <li><a href="signup.jsp" class="button small fit">Sign Up</a></li>
                <li><input type="submit" value="Login" class="button small primary fit"></li>
            </ul>
        </form>
    </div>
</header>
<!-- Main -->
<div id="main">
    <section id="one">
            <header class="major">
                    <h3><strong>FavoUni</strong> helps you connect and join favorite activities in your university.</h3>
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