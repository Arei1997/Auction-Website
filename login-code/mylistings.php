<?php include_once("header.php")?>
<?php require("utilities.php")?>
<?php include_once("include/checkauth.php"); ?>
<div class="container">

<h2 class="my-3">My listings</h2>


<div class="container mt-5">

<!-- TODO: If result set is empty, print an informative message. Otherwise... -->

<ul class="list-group">

<!-- TODO: Use a while loop to print a list item for each auction listing
     retrieved from the query -->

<?php

  $user_id = $_SESSION['user']['id'];
  $getUserListingQuery = "select * from tbl_listings where user_id = $user_id";
  $listings = $mysqli->query($getUserListingQuery);
  // Demonstration of what listings will look like using dummy data.
  foreach($listings as $row){
    print_listing_li($row['listing_id'], $row['title'], $row['details'], $row['starting_price'], 0, $row['end_date']);
  }

?>

</ul>

<?php
  // This page is for showing a user the auction listings they've made.
  // It will be pretty similar to browse.php, except there is no search bar.
  // This can be started after browse.php is working with a database.
  // Feel free to extract out useful functions from browse.php and put them in
  // the shared "utilities.php" where they can be shared by multiple files.
  
  
  // TODO: Check user's credentials (cookie/session).
  
  // TODO: Perform a query to pull up their auctions.
  
  // TODO: Loop through results and print them out as list items.
  
?>

<?php include_once("footer.php")?>