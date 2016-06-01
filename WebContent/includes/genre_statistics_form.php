<?php	
	if(empty($_POST['genre_statistics_year_input']) || empty($_POST['genre_statistics_endyear_input']))
	{
		return false;
	}
	
	$genre_statistics_year_input = $_POST['genre_statistics_year_input'];
	$genre_statistics_endyear_input = $_POST['genre_statistics_endyear_input'];
	
	$to = 'receiver@yoursite.com'; // Email submissions are sent to this email

	// Create email	
	$email_subject = "Message from My Site.";
	$email_body = "You have received a new message. \n\n".
				  "Genre_Statistics_Year_Input: $genre_statistics_year_input \nGenre_Statistics_Endyear_Input: $genre_statistics_endyear_input \n";
	$headers = "From: contact@yoursite.com\n";
	$headers .= "Reply-To: DoNotReply@yoursite.com";	
	
	mail($to,$email_subject,$email_body,$headers); // Post message
	return true;			
?>