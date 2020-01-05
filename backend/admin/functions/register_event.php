<?php
include('./init.php');

if($_SERVER['REQUEST_METHOD']=="POST"){
    
    $errors=array();
    $response=array();
    
    // Execute 
    $eventid=clean($_POST["eventid"]);
    $anweshaid=clean($_POST["anweshaid"]);
    $access_token=clean($_POST["access_token"]);

    if(eventExists($eventid)){ // Checking for existence of event. Declared in functions.php

        $sql = "SELECT first_name,last_name, phone, events_registered, email, qrcode FROM users WHERE anweshaid='$anweshaid' and access_token='$access_token'";
        $result=query($sql);
        confirm($result);
        // Checking if user is valid or not
        if(row_count($result)==1){

            // Fetch event details
            $sql1="SELECT * FROM events WHERE ev_id='$eventid'";
            $result1=query($sql1);
            $row1=fetch_array($result1);
            $regis=json_decode($row1["ev_registrations"]);
            $ev_name=$row1["ev_name"];

            $row=fetch_array($result);
            $email=$row['email'];
            $qrcode=$row['qrcode'];

            // Check if user has already registered or not
            if(alreadyRegistered($anweshaid, $regis)){
                $response['status']=302;
                $errors[]="Already registered.";
                // set_message("<p class='bg-danger text-center'>You have already registered this event.</p>");
            }else{

                /**  Things to be implemented
                 * 1. Enter the data into the ev_registrations column of events table.
                 * 2. Update the event registration in the user table corresponding to that user
                 * 3. Update the data in the present users table events_registered column
                 */

                // Updating the data into the events table.
                $reg=array();
                $reg["anweshaid"]=$anweshaid;
                $reg["name"]=$row["first_name"]." ".$row["last_name"];
                $reg["phone"]=$row["phone"];
                $reg['amount']=0;
                $reg["time"]=date('Y-m-d H:i:s');
                $regis[]=$reg;
                $regis=json_encode($regis);
                $sql2="UPDATE events SET ev_registrations='$regis' WHERE ev_id='$eventid'";
                $result2=query($sql2);

                // Updating the data into the user table.
                $ev_registered=json_decode($row["events_registered"]);
                $add_event=array();
                $add_event["ev_name"]=$ev_name;
                $add_event["ev_id"]=$eventid;
                $add_event["amount"]=0;
                $ev_registered[]=$add_event;
                $ev_registered=json_encode($ev_registered);
                $sql3="UPDATE users SET events_registered='$ev_registered' WHERE anweshaid='$anweshaid'";
                $result3=query($sql3);

                // Check if user is present in the present user table or not
                // $sql4="SELECT * FROM present_users WHERE anweshaid='$anweshaid'";
                // $result4=query($sql4);
                // if(row_count($result4)==1){
                //     // Update the data in the present users table events_registered columnr
                //     $sql5="UPDATE present_users SET events_registered='$ev_registered' WHERE anweshaid='$anweshaid'";
                //     $result5=query($sql5);
                // }

                $subject="Anwesha2k20 Events Registration";
                $msg="<p>
                Hi ".$row['first_name']." ".$row['last_name']." you have successfully registered for $ev_name. <br/>
                    Your Anwesha Id is ".$anweshaid.". <br/>
                    You qr code is <img src='$qrcode'/> <a href='$qrcode'>click here</a><br/> </p>
                ";
                $header="From: noreply@yourwebsite.com";
                send_email($email,$subject,$msg,$header);

                $response['status']=202;
                $errors[]="Successfully registered the user.";
                // set_message("<p class='bg-success text-center'>Successfully registered the user for the event $ev_name</p>");

            }

        }else{
            $response['status']=401;
            $errors[]="Unauthorized access. Anwesha ID or access token doesn't match.";
            // set_message("<p class='bg-danger text-center'>Unauthorized access. Anwesha ID or access token doesn't match.</p>");
        } // End of else part of user authentication.
    }else{
        $response['status']=404;
        $errors[]="Event not found.";
        // set_message("<p class='bg-danger text-center'>Event not found.</p>");
    } // End of checking if event exists or not

    $response['message']=$errors;
    echo json_encode($response);
    // redirect("../../../events/success.php");
}

// To check if a person has already registered or not
function alreadyRegistered($anweshaid,$regis){
    if($regis == NULL)
        return false;
    foreach($regis as $reg){
        $id=$reg->anweshaid;
        if($id==$anweshaid){
            return true;
        }
    }
    return false;
}