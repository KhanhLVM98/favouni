<header id="header">
<div class="row">
    <div class="col-6 col-12-xsmall">
        <a href="#" class="image avatar"><img src="images/avatar.jpg"/></a>                                   
    </div>
    <div class="col-6 col-12-xsmall">
        <a href="home">Home</a>
        <br/>
        <a href="profile?username=${u.username}">Profile Details</a>
        <br/>
        <a href="create">Create Activities</a>
        <br/>
        <a href="manage">Manage Activities</a>
        <br/>
        <a href="logout">Logout</a>
    </div>
</div>
<div class="row">
    <h3><strong>${u.fullname}</strong></h3>
</div>                           
<hr/>
<h4>People you may know</h4>
<c:forEach items="${us.topUser}" var="uf">
    <c:if test="${us.allUser!= null && us.getFriend(u.username,uf.username) != 1 && uf.username != u.username}">
        <ul class="actions fit">
            <li><a href="profile?username=${uf.username}" class="fit"> ${uf.getUser(uf.username).fullname} </a></li>
            <li><a href="addfriend?username=${uf.username}" class="button small fit">Add friend</a></li>
        </ul>
    </c:if>
</c:forEach>       
</header>