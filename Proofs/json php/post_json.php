

<?php
$json = file_get_contents('php://input');

$FloorSeconds = mktime();



$FloorSeconds = $FloorSeconds / 100;

$FloorSeconds = round($FloorSeconds);

$FloorSeconds = floor( $FloorSeconds);

//echo $json;
//echo ("\n");

$obj = json_decode($json, true);
echo $obj;
if (count($obj) == 0)
{
  $response = '{ "status":"error", "message":"Please check your JSON formatting", "timestamp":"'. $FloorSeconds . '"   }';
    echo $response;
}
else
{
$id =  $obj['light']['id'];

//echo("id:" . $id . "\n");

$state =  $obj['light']['state'];

//$secret =  $obj['lights']['secret'];

$key =  $obj['light']['key'];
$timestamp =  $obj['light']['timestamp'];


$signature = $obj['light']['signature'];

$secret = "";
//********************GET SECRET
$sql = "SELECT * FROM Users WHERE key = '" . $key . "';";
//echo $sql;

$db = new PDO('sqlite:/var/www/v1/pi.s3db');

$result  = $db->query($sql);


$update_sql = "";
$counter = 0;
$userid = -1;

foreach($result as $row)
{

$secret = $row['secret'];
$userid = $row['user_id'];

}

//echo("\nUTC:" . $FloorSeconds .  "\n");

$hash = md5($key . "&" . $secret . "&" . $FloorSeconds);
$authenticated = false;
//echo("key:" . $key . "\n");
//echo("secret:" . $secret . "\n");
//echo("hash:" . $hash . "\n");

//if ($hash == $signature)
//{
   //echo "\nITS A MATCH\n";
 //  $authenticated = true;
//}
//echo("state:" . $state . "\n");


if ( strcmp( $timestamp, $FloorSeconds))
{
$authenticated = true;

}
if ($authenticated == true)
        {
$update_sql = 'UPDATE lights SET state=' . $state . ',lastupdated=' . time() .  ' WHERE id = '. $id . ';';
 // echo($update_sql);
        $db->exec($update_sql);
        $db = NULL;

        //if ($authenticated == true)

$response = '{ "status":"ok", "message":"Light updated successfully", "timestamp":"'. $FloorSeconds . '", "Light":{ "id":"' . $id . '", "state":"' . $state . '"   }  }';
}
else
{
    $response = '{ "status":"error", "message":"Timestamps do not match!", "timestamp":"'. $FloorSeconds . '"   }';
}
echo $response;
//var_dump($obj);
}
?>