<?php
	// connect to the database
	header('Content-Type: application/json');
	include('usbong-store-connect.php');

	$mysqli->set_charset("utf8");
		
/*	
    if (!$mysqli->set_charset("utf8")) {
            printf("Error loading character set utf8: %s\n", $mysqli->error);
    } else {
            printf("Current character set: %s\n", $mysqli->character_set_name());
    }
*/
	// get the records from the database
/*	if ($result = $mysqli->query("SELECT * FROM product"))
*/
	if ($result = $mysqli->query("SELECT * FROM product INNER JOIN product_type ON product.product_type_id=product_type.product_type_id")) 
	{
		// display records if there are records to display
		if ($result->num_rows > 0)
		{
			$responses = array();
		
			while ($row = $result->fetch_object())
			{
				$jsonResponse = array(
						"product_id" => $row->product_id,
						"merchant_id" => $row->merchant_id,
						"product_type_id" => $row->product_type_id,
						"product_type_name" => $row->product_type_name,					
						"name" => $row->name,
						"price" => $row->price,
						"previous_price" => $row->previous_price,
						"language" => $row->language,
						"author" => $row->author,
						"supplier" => $row->supplier,
						"description" => $row->description,
						"image_location" => $row->image_location,
						"format" => $row->format,
						"quantity_in_stock" => $row->quantity_in_stock,
						"translator" => $row->translator,
						"pages" => $row->pages
				);
				$responses[] = $jsonResponse;
				
			}
			echo json_encode($responses);
		}
		// if there are no records in the database, display an alert message
		else
		{
				echo "No results to display!";
		}
	}
	// show an error if there is an issue with the database query
	else
	{
			echo "Error: " . $mysqli->error;
	}
	
	// close database connection
	$mysqli->close();
?>