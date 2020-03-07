<h2><strong>${a.actID} . ${a.actName}</strong></h2>
<div class="box alt">
    <div class="row gtr-50 gtr-uniform">                               
            <div class="col-4"><span class="image fit"><img src="images/thumbs/01.jpg" alt="" /></span></div>
            <div class="col-4"><span class="image fit"><img src="images/thumbs/02.jpg" alt="" /></span></div>
            <div class="col-4"><span class="image fit"><img src="images/thumbs/03.jpg" alt="" /></span></div>
    </div>
</div>
<div class="table-wrapper">
    <table>
        <thead>
            <tr>
                <th>Location</th>
                <th>Time</th>
                <th>Date</th>
                <th>Category</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <tr>      
                <td>${a.actLocation}</td>
                <td>${a.actTime}</td>
                <td>${a.actDate}</td>                           
                <td>${a.categories}</td>
                <td>${a.description}</td>											
            </tr>
        </tbody>
    </table>
</div>