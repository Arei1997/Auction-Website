<?php include_once("header.php")?>
<?php require("utilities.php")?>
<?php /*include 'dbconfig.php'*/?>

<div class="container">

<h2 class="my-3">Browse listings</h2>

<div id="searchSpecs">
<!-- When this form is submitted, this PHP page is what processes it.
     Search/sort specs are passed to this page through parameters in the URL
     (GET method of passing data to a page). -->
<form method="get" action="browse.php">
  <div class="row">
    <div class="col-md-5 pr-0">
      <div class="form-group">
        <label for="keyword" class="sr-only">Search keyword:</label>
	    <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text bg-transparent pr-0 text-muted">
              <i class="fa fa-search"></i>
            </span>
          </div>
          <input type="text" class="form-control border-left-0" name="keyword" id="keyword" placeholder="Search for anything">
        </div>
      </div>
    </div>
    <div class="col-md-3 pr-0">
      <div class="form-group">
        <label for="cat" class="sr-only">Search within:</label>
        <select class="form-control" id="cat" name="cat">
          <option selected value="all">All categories</option>
          <?php $category_query = "SELECT name FROM categories ORDER by name";
          $category_return = $mysqli->query($category_query)
              or die('Error: Could not make category query');
          while ($categoryrow = mysqli_fetch_array($category_return)) {
              echo ('<option value='. $categoryrow[0]. '>'. $categoryrow[0] .'</option>');
          }
          ?>
        </select>
      </div>
    </div>
    <div class="col-md-3 pr-0">
      <div class="form-inline">
        <label class="mx-2" for="order_by">Sort by:</label>
        <select class="form-control" id="order_by" name="order_by">
          <option selected value="pricelow">Price (low to high)</option>
          <option value="pricehigh">Price (high to low)</option>
          <option value="date">Soonest expiry</option>
        </select>
      </div>
    </div>
    <div class="col-md-1 px-0">
      <button type="submit" class="btn btn-primary">Search</button>
    </div>
  </div>
</form>
</div> <!-- end search specs bar -->


</div>

<?php
 
  $results_per_page = 10;

  if (!isset($_GET['keyword'])) {
    $query = "SELECT tbl_listings.listing_id, tbl_listings.title, tbl_listings.details, MAX(biding.biding_price), tbl_listings.starting_price, tbl_listings.end_date
				   FROM tbl_listings LEFT JOIN biding ON tbl_listings.listing_id=biding.listing_id WHERE title IS NOT NULL";
	}
  
  else {
    $keyword = mysqli_real_escape_string(mysqli_connect('localhost', 'root', '', 'mydatabase'), $_GET['keyword']);
    if ($keyword == '')
		{
			 $query = "SELECT tbl_listings.listing_id, tbl_listings.title, tbl_listings.details, MAX(biding.biding_price), tbl_listings.starting_price, tbl_listings.end_date
					   FROM tbl_listings LEFT JOIN biding ON tbl_listings.listing_id=biding.listing_id WHERE title IS NOT NULL";
		}
		else
		{
			 $query = "SELECT tbl_listings.listing_id, tbl_listings.title, tbl_listings.details, MAX(biding.biding_price), tbl_listings.starting_price, tbl_listings.end_date
					   FROM tbl_listings LEFT JOIN biding ON tbl_listings.listing_id=biding.listing_id WHERE title LIKE '%$keyword%'";
		}
  
	}
  

  if (!isset($_GET['cat'])) {
    {
      $query .= " AND category_id IS NOT NULL";
   }
  }
  else {
    $category = $_GET['cat'];
    if ($category == "all")
		{
			 $query .= " AND category_id IS NOT NULL";
		}
		else
		{
			 $categoryID_query = "SELECT category_id FROM categories WHERE name = '$category'";
			 $categoryID_result = $mysqli->query($categoryID_query) 
				or die('Error: Could not complete title query');
			 $categoryID = mysqli_fetch_array($categoryID_result);
			 $category = $categoryID[0];
			 $query .= " AND category_id = '$category'";
		}
  }

 
  if (!isset($_GET['order_by'])) {
    $query_result = $query . " GROUP BY tbl_listings.listing_id ORDER BY (CASE WHEN (tbl_listings.end_date > CURRENT_TIMESTAMP) THEN TIMEDIFF(tbl_listings.end_date,CURRENT_TIMESTAMP) 
			ELSE ADDTIME((TIMEDIFF(CURRENT_TIMESTAMP, tbl_listings.end_date)),\"10000:0:0\") END) 
      LIMIT $results_per_page";
  }
  else {
    $order_by = $_GET['order_by'];

    if ($order_by == '') {
      $query_result = $query . " GROUP BY tbl_listings.listing_id ORDER BY (CASE WHEN (tbl_listings.end_date > CURRENT_TIMESTAMP) THEN TIMEDIFF(tbl_listings.end_date,CURRENT_TIMESTAMP) 
			ELSE ADDTIME((TIMEDIFF(CURRENT_TIMESTAMP, tbl.listings.end_date)),\"10000:0:0\") END)
      LIMIT $results_per_page";
    }

    if ($order_by == 'date') {
			$query_result = $query . " GROUP BY tbl_listings.listing_id ORDER BY (CASE WHEN (tbl_listings.end_date > CURRENT_TIMESTAMP) THEN TIMEDIFF(tbl_listings.end_date,CURRENT_TIMESTAMP) 
			ELSE ADDTIME((TIMEDIFF(CURRENT_TIMESTAMP, tbl_listings.end_date)),\"10000:0:0\") END) 
      LIMIT $results_per_page";
		}
		
		if ($order_by == 'pricelow') {
			$query_result = $query . " GROUP BY tbl_listings.listing_id ORDER BY (CASE WHEN MAX(biding.biding_price) IS NULL THEN tbl_listings.starting_price
			ELSE MAX(biding.biding_price) END)
      LIMIT $results_per_page";
		}

		if ($order_by == 'pricehigh') {
			$query_result = $query . " GROUP BY tbl_listings.listing_id ORDER BY (CASE WHEN MAX(biding.biding_price) IS NULL THEN tbl_listings.starting_price
			ELSE MAX(biding.biding_price) END) 
      DESC LIMIT $results_per_page";
		}
  }

  $temp = explode(" ",$query);
	$temp[1] = "COUNT(DISTINCT tbl_listings.listing_id)";
	$temp[2] = "";
	$temp[3] = "";
	$temp[4] = "";
	$temp[5] = "";
	$temp[6] = "";



  $num_query = implode(" ",$temp);
 
	$num_result = $mysqli->query($num_query)
			or die('Error making count query');

	$row = mysqli_fetch_array($num_result);

	$num_results = $row[0]; 

	if ($num_results < 1) {
		$max_page = 1;
	}
	else {
		$max_page = ceil($num_results / $results_per_page);
	}
	if (!isset($_GET['page'])){
		$curr_page = 1;
		}
	else {
		if ($_GET['page'] == 1) 
		{
			$curr_page = 1;
		}
		else
		{
			$current_page = $_GET['page'];
			$offset = ($current_page*$results_per_page)-$results_per_page;
			$query_result .= " OFFSET $offset"; 

		}
	}

  
?>


<div class="container mt-5">

<!-- TODO: If result set is empty, print an informative message. Otherwise... -->
<?php
  if ($num_results < 1){
      echo("No results for that search!");
    }
?>

<ul class="list-group">

<!-- TODO: Use a while loop to print a list item for each auction listing
     retrieved from the query -->


<?php 
  $result = $mysqli->query($query_result)
    or die('Error making select users query');
  while ($row = mysqli_fetch_array($result)){	

    $count_bid_query = "SELECT COUNT(*) FROM biding WHERE listing_id = {$row['listing_id']}";
    $count_bid_result = $mysqli->query($count_bid_query)
      or die('Error finding top bid');

    $bid_count = mysqli_fetch_array($count_bid_result);

    if ($bid_count[0] == 0) {
      print_listing_li($row['listing_id'], $row['title'], $row['details'], $row['starting_price'], $bid_count[0], date_create($row['end_date']));
    }
    else {

      print_listing_li($row['listing_id'], $row['title'], $row['details'], $row['MAX(biding.biding_price)'], $bid_count[0], date_create($row['end_date']));

    }

  }

?>

<?php
/*
    $getUserListingQuery = "SELECT * from tbl_listings";
    $tbl_listings = $mysqli->query($getUserListingQuery);
    foreach($tbl_listings as $row){
      print_listing_li($row['listing_id'], $row['title'], $row['details'], $row['starting_price'], 0, $row['end_date']);
    }*/
?>

</ul>


<!-- Pagination for results tbl_listings -->
<nav aria-label="Search results pages" class="mt-5">
  <ul class="pagination justify-content-center">
  
<?php
  // Copy any currently-set GET variables to the URL.
  $querystring = "";
  foreach ($_GET as $key => $value) {
    if ($key != "page") {
      $querystring .= "$key=$value&amp;";
    }
  }
  if (!isset($_GET['page'])){
    $curr_page = 1;
  }
  else{
    $curr_page = $_GET['page'];
  }

  $high_page_boost = max(3 - $curr_page, 0);
  $low_page_boost = max(2 - ($max_page - $curr_page), 0);
  $low_page = max(1, $curr_page - 2 - $low_page_boost);
  $high_page = min($max_page, $curr_page + 2 + $high_page_boost);

  if ($curr_page != 1) {
    echo('
    <li class="page-item">
      <a class="page-link" href="browse.php?' . $querystring . 'page=' . ($curr_page - 1) . '" aria-label="Previous">
        <span aria-hidden="true"><i class="fa fa-arrow-left"></i></span>
        <span class="sr-only">Previous</span>
      </a>
    </li>');
  }
    
  for ($i = $low_page; $i <= $high_page; $i++) {
    if ($i == $curr_page) {
      // Highlight the link
      echo('
    <li class="page-item active">');
    }
    else {
      // Non-highlighted link
      echo('
    <li class="page-item">');
    }
    
    // Do this in any case
    echo('
      <a class="page-link" href="browse.php?' . $querystring . 'page=' . $i . '">' . $i . '</a>
    </li>');
  }
  
  if ($curr_page != $max_page) {
    echo('
    <li class="page-item">
      <a class="page-link" href="browse.php?' . $querystring . 'page=' . ($curr_page + 1) . '" aria-label="Next">
        <span aria-hidden="true"><i class="fa fa-arrow-right"></i></span>
        <span class="sr-only">Next</span>
      </a>
    </li>');
  }
?>

  </ul>
</nav>


</div>



<?php include_once("footer.php")?>