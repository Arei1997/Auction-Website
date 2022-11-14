<?php include_once("header.php")?>

<div class="container">
<h2 class="my-3">Register new account</h2>

<?php

if(isset($_POST['btnRegister'])){

  $username = $_POST['username'];
  $email_address = $_POST['email_address'];
  $post_code = $_POST['post_code'];
  $password = $_POST['password'];
  $address = $_POST["address"];
  $password  = password_hash($password, PASSWORD_DEFAULT);

$registerQuery = "INSERT INTO users (username, email_address, address, post_code, password, is_active)
VALUES ('$username', '$email_address', '$address', '$post_code', '$password', 1)";

if ($mysqli->query($registerQuery) === TRUE) {
  echo "<script>alert('Your account has been created successfully. Please Login to continue')</script>";

} else {
  echo "<script>alert('Something went wrong, while creating account.')</script>";
}


}
?>

<!-- Create auction form -->
<form method="POST">
  <!-- <div class="form-group row">
    <label for="accountType" class="col-sm-2 col-form-label text-right">Registering as a:</label>
	<div class="col-sm-10">
	  <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="accountType" id="accountBuyer" value="buyer" checked>
        <label class="form-check-label" for="accountBuyer">Buyer</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="accountType" id="accountSeller" value="seller">
        <label class="form-check-label" for="accountSeller">Seller</label>
      </div>
      <small id="accountTypeHelp" class="form-text-inline text-muted"><span class="text-danger">* Required.</span></small>
	</div>
  </div> -->

  <div class="form-group row">
    <label for="username" class="col-sm-2 col-form-label text-right">Username</label>
	<div class="col-sm-10">
      <input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
      <small id="usernameHelp" class="form-text text-muted"><span class="text-danger">* Required.</span></small>
	</div>
  </div>

  <div class="form-group row">
    <label for="email_address" class="col-sm-2 col-form-label text-right">Email Address</label>
	<div class="col-sm-10">
      <input type="text" class="form-control" id="email_address" placeholder="Email Address" name="email_address" required>
      <small id="emailHelp" class="form-text text-muted"><span class="text-danger">* Required.</span></small>
	</div>
  </div>
<div class="form-group row">
    <label for="address" class="col-sm-2 col-form-label text-right">Address</label>
	<div class="col-sm-10">
      <input type="text" class="form-control" id="address_" placeholder="Address" name="address" required>
      <small id="address" class="form-text text-muted"><span class="text-danger">* Required.</span></small>
	</div>
  </div>

<div class="form-group row">
    <label for="postcode" class="col-sm-2 col-form-label text-right">Postcode</label>
	<div class="col-sm-10">
      <input type="text" class="form-control" id="postcode" placeholder="Postcode" name="post_code" required>
      <small id="postcodeHelp" class="form-text text-muted"><span class="text-danger">* Required.</span></small>
	</div>
  </div>  
<div class="form-group row">
    <label for="password" class="col-sm-2 col-form-label text-right">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="password" placeholder="Password" name="password" required>
      <small id="passwordHelp" class="form-text text-muted"><span class="text-danger">* Required.</span></small>
    </div>
  </div>
  
  <div class="form-group row">
    <button type="submit" class="btn btn-primary form-control" name="btnRegister">Register</button>
  </div>
</form>

<div class="text-center">Already have an account? <a href="" data-toggle="modal" data-target="#loginModal">Login</a>

</div>

<?php include_once("footer.php")?>