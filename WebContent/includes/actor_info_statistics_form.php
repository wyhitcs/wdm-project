<?php	
	if(empty($_POST['actor_id_input']) || empty($_POST['actor_name_input']))
	{
		return false;
	}
	
	$actor_id_input = $_POST['actor_id_input'];
	$actor_name_input = $_POST['actor_name_input'];
	
	$to = 'receiver@yoursite.com'; // Email submissions are sent to this email

	// Create email	
	$email_subject = "Message from My Site.";
	$email_body = "You have received a new message. \n\n".
				  "Actor_Id_Input: $actor_id_input \nActor_Name_Input: $actor_name_input \n";
	$headers = "From: contact@yoursite.com\n";
	$headers .= "Reply-To: DoNotReply@yoursite.com";	
	
	mail($to,$email_subject,$email_body,$headers); // Post message
	return true;			
?>