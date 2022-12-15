<?php include 'include\dbconfig.php'?>
<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

// gets buyer with the highest bid
$buyer_email_query = "SELECT email_address, title FROM biding LEFT JOIN tbl_listings ON biding.listing_id = tbl_listings.listing_id LEFT JOIN users ON biding.user_id = users.id
WHERE (biding_price, biding.listing_id) IN( SELECT MAX(biding_price), listing_id FROM biding
WHERE listing_id IN( SELECT listing_id FROM tbl_listings WHERE NOW() > end_date AND DATE_ADD(end_date, INTERVAL 30 MINUTE) >= NOW()) AND starting_price >= reserve_price GROUP BY listing_id)";

$seller_email_query = "SELECT title, email_address FROM users INNER JOIN tbl_listings ON users.id = tbl_listings.user_id WHERE NOW() > end_date AND DATE_ADD(end_date, INTERVAL 30 MINUTE) >= NOW()";

$seller_email_result = $mysqli->query($seller_email_query)
		or die('Error making seller email query');
$buyer_email_result = $mysqli->query($buyer_email_query)
    or die('Error making winner email query');// gets seller

// mailer function
function smtpmailer($to, $from, $from_name, $subject, $body)
{

    $mail = new PHPMailer();

    /* Tells PHPMailer to use SMTP. */
    $mail->isSMTP();
    $mail->SMTPDebug = SMTP::DEBUG_SERVER;
    $mail->SMTPAuth   = TRUE;
    $mail->SMTPSecure = "ssl"; // 使用ssl
    /* SMTP parameters. */
    $mail->Port       = 465; // 端口改成465
    $mail->Host       = "smtp.qq.com";
    $mail->Username   = "978338509@qq.com";
    $mail->Password   = "snywkqllddzzbfda";
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

// email seller
			while($row = mysqli_fetch_array($seller_email_result)){

				$from = '978338509@qq.com'; // 换成你自己的QQ邮箱
				$name = 'Auction administrator';
				$toSeller   = $row[1];
				$subjSeller = 'Your auction" '.$row[0].' "has finished.';
				$msgSeller = 'Your auction called "'.$row[0].'" has now ended. Be sure to check out what bids you got!';
				$error=smtpmailer($toSeller,$from,$name,$subjSeller,$msgSeller);

			}
// email buyer
			while($row = mysqli_fetch_array($buyer_email_result)){

        $from = '978338509@qq.com'; // 换成自己的QQ邮箱
        $name = 'Auction administrator';
        $toBuyer   = $row[0];
        $subjBuyer = 'You are the winner!';
        $msgBuyer = 'Your bid of on the auction called "'.$row[1].'" has now ended... And you are the highest bidder! Congratulations!';
        $error=smtpmailer($toBuyer,$from,$name,$subjBuyer,$msgBuyer);

      }
?>

<html>
    <head>
        <title>Send Auction End Email</title>
    </head>
    <body style="background: black;">
        <center><h2 style="padding-top:70px;color: white;"><?php echo $error; ?></h2></center>
    </body>

</html>
