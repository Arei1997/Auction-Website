<?php include 'include\dbconfig.php'?>
<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/Exception.php';
require 'PHPMailer/PHPMailer.php';
require 'PHPMailer/SMTP.php';
?>
<?php
function smtpmailer($to, $from, $from_name, $subject, $body)
    {

			$mail = new PHPMailer;

			/* Tells PHPMailer to use SMTP. */
			$mail->isSMTP();
			#$mail->SMTPDebug = SMTP::DEBUG_SERVER;
			$mail->SMTPAuth   = TRUE;
			$mail->SMTPSecure = "ssl"; // 使用ssl
			/* SMTP parameters. */
			$mail->Port       = 465; // 端口改成456
			$mail->Host       = "smtp.qq.com";
			$mail->Username   = "978338509@qq.com"; 
			$mail->Password   = "imfsscrmdkcqbeci";
			$mail->isHTML(true);
			/* Add a recipient. */
			$mail->addAddress($to, 'User');
			/* Set the mail sender. */
			$mail->setFrom($from, $from_name);
			/* Set the subject. */
			$mail->Subject = $subject;
			/* Set the mail message body. */
			$mail->Body = $body;
			/* Finally send the mail. */
			if(!$mail->Send())
			{
					$error ="Email failed to send.";
					return $error;
			}
			else
			{
					$error = "Thanks You !! Your email is sent.";
					return $error;
			}
	}

if (isset($_SESSION['user'])){
  $listing_id = $_SESSION['curitem_id'];


  //Get the emails of people who are watching an item
  $watchlist_email_query = "SELECT email_address FROM users WHERE id IN(SELECT user_id FROM watchlist WHERE listing_id = $listing_id)";
  $watchlist_result = mysqli_query($mysqli, $watchlist_email_query)
	 or die('Error making watchlist email query');

   // Gets the email of the person placing the bid
   $buyer_email_query = "SELECT email_address FROM users WHERE id= $user_id";
   $result = mysqli_query($mysqli, $buyer_email_query)
   or die('Error making buyer email query');
  $buyer_email = mysqli_fetch_array($result);

  //Gets the title of the auction in question
  $listing_title_query = "SELECT item_title FROM listings WHERE listing_id = $listing_id";
  $title_result = mysqli_query($mysqli, $listing_title_query)
	 or die('Error making listing title query');
   $listing_title = mysqli_fetch_array($title_result);

   //Gets the email of the outbid buyer
   $outbid_query = "SELECT email_address FROM users WHERE id IN(
						SELECT user_id FROM bidings WHERE listing_id = $item_id AND biding_price = $previous_top_bid)";
  $outbid_result = mysqli_query($mysqli, $outbid_query)
	 or die('Error making outbid email query');
   $outbid_email = mysqli_fetch_array($outbid_result);


$buyer_notified = 0;

if ($buyer_email[0] == $outbid_email[0]) {
	$name = "Auction administrator"; //sender’s name
	$from = "comp0178group3@gmail.com"; //sender’s e mail address
	$recipient = "$buyer_email[0]"; //recipient
	$mail_body = "This is an email confirming that you have bid £$bid_price on the auction called '$listing_title[0]'"; //mail body
	$subject = "Bid confirmation"; //subject
	$error = smtpmailer($recipient,$from,$name,$subject,$mail_body); //mail function
	$buyer_notified = 1;
}
else {
	$name = "Auction administrator"; //sender’s name
	$from = "comp0178group3@gmail.com"; //sender’s e mail address
	$recipient = "$outbid_email[0]"; //recipient
	$mail_body = "Your bid of £$previous_top_bid on the auction called '$listing_title[0]' has been outbid. The current highest bid is now £$bid_price"; //mail body
	$subject = "Outbid notification"; //subject
	$error = smtpmailer($recipient,$from,$name,$subject,$mail_body); //mail function
}

while ($row = mysqli_fetch_array($watchlist_result))
{
	if ($row[0] == $outbid_email[0]) {
		continue;
	}

	if (($row[0] == $buyer_email[0]) and ($buyer_notified == 1)) {
		continue;
	}

	if ($row[0] == $buyer_email[0]) {
		$name = "Auction administrator"; //sender’s name
		$from = "comp0178group3@gmail.com"; //sender’s e mail address
		$recipient = "$buyer_email[0]"; //recipient
		$mail_body = "This is an email confirming that you have bid £$bid_price on the auction called '$listing_title[0]'"; //mail body
		$subject = "Bid confirmation"; //subject
		$error = smtpmailer($recipient,$from,$name,$subject,$mail_body); //mail function
	}
	else {
		$name = "Happy Auction House"; //sender’s name
		$from = "comp0178group3@gmail.com"; //sender’s e mail address
		$recipient = "$row[0]"; //recipient
		$mail_body = "The auction called '$listing_title[0]' which you are watching just received a bid for £$bid_price "; //mail body
		$subject = "Auction you are watching"; //subject
		$error = smtpmailer($recipient,$from,$name,$subject,$mail_body); //mail function
	}
}
}


?>
