<?php
session_start();
include_once("config.php");


if(isset($_POST["type"]) && $_POST["type"]=='add' && $_POST["product_qty"]>0)
{
	foreach($_POST as $key => $value){ 
		$new_product[$key] = filter_var($value, FILTER_SANITIZE_STRING);
    }
	
	unset($new_product['type']);
	unset($new_product['return_url']); 
	
 	
    $statement = $mysqli->prepare("SELECT product_name, price FROM products WHERE product_code=? LIMIT 1");
    $statement->bind_param('s', $new_product['product_code']);
    $statement->execute();
    $statement->bind_result($product_name, $price);
	
	while($statement->fetch()){
		
		
        $new_product["product_name"] = $product_name; 
        $new_product["product_price"] = $price;
        
        if(isset($_SESSION["cart_products"])){ 
            if(isset($_SESSION["cart_products"][$new_product['product_code']])) 
            {
                unset($_SESSION["cart_products"][$new_product['product_code']]); 
            }           
        }
        $_SESSION["cart_products"][$new_product['product_code']] = $new_product; 
    } 
}



if(isset($_POST["product_qty"]) || isset($_POST["remove_code"]))
{
	
	if(isset($_POST["product_qty"]) && is_array($_POST["product_qty"])){
		foreach($_POST["product_qty"] as $key => $value){
			if(is_numeric($value)){
				$_SESSION["cart_products"][$key]["product_qty"] = $value;
			}
		}
	}

	if(isset($_POST["remove_code"]) && is_array($_POST["remove_code"])){
		foreach($_POST["remove_code"] as $key){
			unset($_SESSION["cart_products"][$key]);
		}	
	}
}


$return_url = (isset($_POST["return_url"]))?urldecode($_POST["return_url"]):''; //return url
header('Location:'.$return_url);

?>