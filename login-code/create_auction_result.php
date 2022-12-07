<?php include_once("header.php")?>
<?php include_once("include/checkauth.php"); ?>
<div class="container my-5">

<?php

// This function takes the form data and adds the new auction to the database.

/* TODO #1: Connect to MySQL database (perhaps by requiring a file that
            already does this). */


/* TODO #2: Extract form data into variables. Because the form was a 'post'
            form, its data can be accessed via $POST['auctionTitle'], 
            $POST['auctionDetails'], etc. Perform checking on the data to
            make sure it can be inserted into the database. If there is an
            issue, give some semi-helpful feedback to user. */


/* TODO #3: If everything looks good, make the appropriate call to insert
            data into the database. */
            

// If all is successful, let user know.

$txtTitle = $_POST['txtTitle'];
$txtDetails = $_POST['txtDetails'];
$ddCategory = $_POST['ddCategory'];
$txtStartPrice = $_POST['txtStartPrice'];
$txtReservePrice = $_POST['txtReservePrice'];
$txtEndDate = $_POST['txtEndDate'];
$user_id = $_SESSION['user']['id'];
$curdate = date('Y-m-d H:i:s',time());

$insertQuery = "insert into tbl_listings(title,details,category_id,starting_price,reserve_price,end_date,user_id,is_active,created_at)
values('$txtTitle','$txtDetails',$ddCategory,'$txtStartPrice','$txtReservePrice','$txtEndDate',$user_id, 1, '$curdate')";

$insert = $mysqli->query($insertQuery);

if($insert){
    echo('<div class="text-center">Auction successfully created! <a href="mylistings.php">View your new listing.</a></div>');
}else{
    echo('<div class="text-center">Something went wrong! <a href="create_auction.php">Create Again</a></div>');
}



?>

</div>


<?php include_once("footer.php")?>