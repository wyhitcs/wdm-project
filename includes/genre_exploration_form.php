<?php	
	if(empty($_POST['exploration_genre_label_input']) || empty($_POST['exploration_year_input']) || empty($_POST['exploration_endyear_input']))
	{
		return false;
	}
	
	$exploration_genre_label_input = $_POST['exploration_genre_label_input'];
	$exploration_year_input = $_POST['exploration_year_input'];
	$exploration_endyear_input = $_POST['exploration_endyear_input'];
	
	$to = 'receiver@yoursite.com'; // Email submissions are sent to this email

	// Create email	
	$email_subject = "Message from My Site.";
	$email_body = "You have received a new message. \n\n".
				  "Exploration_Genre_Label_Input: $exploration_genre_label_input \nExploration_Year_Input: $exploration_year_input \nExploration_Endyear_Input: $exploration_endyear_input \n";
	$headers = "From: contact@yoursite.com\n";
	$headers .= "Reply-To: DoNotReply@yoursite.com";	
	
	mail($to,$email_subject,$email_body,$headers); // Post message
	return true;			
?>