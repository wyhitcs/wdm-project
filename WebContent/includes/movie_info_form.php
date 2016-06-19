<?php	
	if(empty($_POST['movie_id_input']) || empty($_POST['movie_name_input']))
	{
		return false;
	}
	
	$movie_id_input = $_POST['movie_id_input'];
	$movie_name_input = $_POST['movie_name_input'];
	
	$to = 'receiver@yoursite.com'; // Email submissions are sent to this email

	// Create email	
	$email_subject = "Message from My Site.";
	$email_body = "You have received a new message. \n\n".
				  "Movie_Id_Input: $movie_id_input \nMovie_Name_Input: $movie_name_input \n";
	$headers = "From: contact@yoursite.com\n";
	$headers .= "Reply-To: DoNotReply@yoursite.com";	
	
	mail($to,$email_subject,$email_body,$headers); // Post message
	return true;			
?>