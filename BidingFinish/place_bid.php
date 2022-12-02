<?php
include_once("header.php");
include_once("include/checkauth.php");
// TODO: Extract $_POST variables, check they're OK, and attempt to make a bid.
// Notify user of success/failure and redirect/give navigation options.

if (isset($_SESSION['user'])){
	$listing_id = $_SESSION['curitem_id'];	
	$user_id = $_SESSION['user']['id'];
	$biding_price = $_POST['bidprice'];
	$biding_time = date('Y-m-d H:i:s',time());
	
	$getStartPriceQuery = "SELECT starting_price FROM tbl_listings WHERE listing_id = $listing_id";
	$getStartPrice = $mysqli->query($getStartPriceQuery);
	$getStartPriceRow = mysqli_fetch_array($getStartPrice);
	
	$getListingOwnerQuery = "SELECT user_id FROM tbl_listings WHERE listing_id = $listing_id";
	$getListingOwner = $mysqli->query($getListingOwnerQuery);
	$getListingOwnerRow = mysqli_fetch_array($getListingOwner);
	
	if($getListingOwnerRow[0]!=$_SESSION['user']['id']){
		if($biding_price > $getStartPriceRow[0]){
			$UpdateNewBidQuery = "UPDATE tbl_listings SET starting_price = $biding_price WHERE listing_id = $listing_id";
			$UpdataNewBid = $mysqli->query($UpdateNewBidQuery);
			
			$getbiding_query = "Insert into biding(listing_id,user_id,biding_price,biding_time) VALUES($listing_id,$user_id,'$biding_price','$biding_time')";
			$biding = $mysqli->query($getbiding_query);
			if ($biding){
				echo('<div class="text-center">Biding successfully created! <a href="mybids.php">View your bidings.</a></div>');
			}else{
				echo('<div class="text-center">Something went wrong! <a href="browse.php">Try again</a></div>');
			}
					
		}else{
			echo "<script>alert('Please Bid from starting price!')</script>";
			header('refresh:0.5;url="listing.php?item_id=' . $listing_id . '"');
		}
	}else{
		echo "<script>alert('You can not bid for your own auction!')</script>";
		header('refresh:0.5;url=browse.php');
	}

	
	
	
	
	
}




?>