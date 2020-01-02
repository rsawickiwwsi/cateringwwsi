<?php
session_start();
include_once("config.php");
?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Karta</title>
<link href="style/style.css" rel="stylesheet" type="text/css"></head>
<body>
<h1 align="center">Wyswietl karte</h1>
<div class="cart-view-table-back">
<form method="post" action="cart_update.php">
<table width="100%"  cellpadding="6" cellspacing="0"><thead><tr><th>Ilosc</th><th>Nazwa</th><th>Cena</th><th>Suma</th></tr></thead>
  <tbody>
 	<?php
	if(isset($_SESSION["cart_products"])) 
    {
		$total = 0;
		$b = 0; 
		foreach ($_SESSION["cart_products"] as $cart_itm)
        {
			
			$product_name = $cart_itm["product_name"];
			$product_qty = $cart_itm["product_qty"];
			$product_price = $cart_itm["product_price"];
			$product_code = $cart_itm["product_code"];
			$subtotal = ($product_price * $product_qty); 
			
		   	$bg_color = ($b++%2==1) ? 'odd' : 'even'; 
		    
			echo '<td><input type="text" size="2" maxlength="2" name="product_qty['.$product_code.']" value="'.$product_qty.'" /></td>';
			echo '<td>'.$product_name.'</td>';
			echo '<td>'.$currency.$product_price.'</td>';
			echo '<td>'.$currency.$subtotal.'</td>';
            echo '</tr>';
			$total = ($total + $subtotal); 
        }
		
		$grand_total = $total + $shipping_cost; 
		foreach($taxes as $key => $value){ 
				$tax_amount     = round($total * ($value / 100));
				$tax_item[$key] = $tax_amount;
				$grand_total    = $grand_total + $tax_amount; 
		}
		
		$list_tax       = '';
		foreach($tax_item as $key => $value){ 
			$list_tax .= $key. ' : '. $currency. sprintf("%01.2f", $value).'<br />';
		}
		
	}
    ?>
    <tr><td colspan="5"><span style="float:right;text-align: right;">Za dowóz: PLN; <?php echo $shipping_cost. $list_tax; ?> </span></td></tr>
    <tr><td colspan="5"><a href="index.php" class="button">Dodaj wiecej</a><button type="submit">Odswiez</button>
  </tbody>
</table>
<input type="hidden" name="return_url" value="<?php 
$current_url = urlencode($url="http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']);
echo $current_url; ?>" />
</form>
</div>
<h1 align="center">Formularz zamówienia</h1>
<div class="cart-view-table-back">
<form name="htmlform" method="post" action="html_form_send.php">
<table width="450px">
</tr>
<tr>
 <td valign="top">
  <label for="first_name">Imię</label>
 </td>
 <td valign="top">
  <input  type="text" name="first_name" maxlength="50" size="30" required>
 </td>
</tr>
<tr>
 <td valign="top"">
  <label for="last_name">Nazwisko</label>
 </td>
 <td valign="top">
  <input  type="text" name="last_name"  maxlength="50" size="30" required>
 </td>
</tr>
<tr>
 <td valign="top">
  <label for="email">Email</label>
 </td>
 <td valign="top">
  <input  type="text" name="email" maxlength="80" size="30">
 </td>
</tr>
<tr>
 <td valign="top">
  <label for="telephone">Data</label>
 </td>
 <td valign="top">
 <input id="today" type="date"required >
 <input type="time" id="end" step="1800" min="10:00" max="24:00">
 </td>
</tr>
<tr>
 <td valign="top">
  <label for="telephone">Telefon</label>
 </td>
 <td valign="top">
  <input  type="text" name="telephone" maxlength="30" size="30"required>
 </td>
</tr>
<tr>
 <td valign="top">
  <label for="notes">Adres</label>
 </td>
 <td valign="top">
  <textarea  name="addres" maxlength="1000" cols="25" rows="6" required></textarea>
 </td>
</tr>
<tr>
<tr><td colspan="5"><span style="float:right;text-align: right;">Kwota do zaplaty: <?php echo sprintf("%01.2f", $grand_total);?></span></td></tr>
 <td colspan="2" style="text-align:center">
 <button type="submit">Zaplac</button></td></tr>
 </td>
</tr>
</table>
</form>
</div>

</body>
</html>
