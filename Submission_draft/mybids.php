<?php include_once("header.php")?>
<?php require("utilities.php")?>
<?php include_once("include/checkauth.php"); ?>
<div class="container">

<h2 class="my-3">My bids</h2>

<div class="container mt-5">

<!-- TODO: If result set is empty, print an informative message. Otherwise... -->


<?php
  // This page is for showing a user the auctions they've bid on.
  // It will be pretty similar to browse.php, except there is no search bar.
  // This can be started after browse.php is working with a database.
  // Feel free to extract out useful functions from browse.php and put them in
  // the shared "utilities.php" where they can be shared by multiple files.
  
  
  // TODO: Check user's credentials (cookie/session).
  
  // TODO: Perform a query to pull up the auctions they've bidded on.
  
  // TODO: Loop through results and print them out as list items.
  $user_id = $_SESSION['user']['id'];
  $getUserbidingQuery = "SELECT * FROM tbl_listings WHERE EXISTS(SELECT * FROM biding WHERE tbl_listings.listing_id = biding.listing_id AND user_id = $user_id)";
  $mybiding = $mysqli->query($getUserbidingQuery);
  
  while($row = mysqli_fetch_array($mybiding)){
    $listingone = $row['listing_id'];

    $getBidingNumQuery = "SELECT COUNT(*) from biding WHERE listing_id = $listingone";
    $BidingNum = $mysqli->query($getBidingNumQuery);   
    $BidingNumRow = mysqli_fetch_array($BidingNum);
    
    $IsUser = 3;
    $YourMaxBidingRow = array(3);
      $CheckBidQuery = "SELECT * FROM biding WHERE user_id = $user_id and listing_id = $listingone";
      $CheckBid = $mysqli->query($CheckBidQuery);
      if(mysqli_num_rows($CheckBid) > 0){
        while($CheckBidrow = mysqli_fetch_array($CheckBid)){
          if($CheckBidrow['biding_price']==$row['starting_price']){
            $IsUser = 0;
          }else{
            $IsUser = 2;
            $YourMaxBidingQuery = "SELECT MAX(biding_price) FROM biding WHERE user_id = $user_id and listing_id = $listingone";
            $YourMaxBiding = $mysqli->query($YourMaxBidingQuery);
            $YourMaxBidingRow = mysqli_fetch_array($YourMaxBiding);
          }
        }
      }
      if($row['user_id']==$_SESSION['user']['id']){
        $IsUser = 1;
      }

    print_listing_li_mybid($row['listing_id'], $row['title'], $row['details'], $row['starting_price'], $BidingNumRow[0], date_create($row['end_date']),$IsUser,$YourMaxBidingRow[0],$row['reserve_price']);
  }
  
  
  
  
?>

<?php include_once("footer.php")?>