/*
Author : Mahendar M
class : CDrives
Discription : This is the httppost class which accepts the post accepts the post request from third party application and provide the status of it.
*/
@RestResource(urlMapping='/Drives/*')
global with sharing class CDrives{
//Restresource post method
 @HttpPost
//This is the actual method,which accepts the posting parameters and processes and send the same parameters to emailnotification class. 
   global static string DoPost(string toaddress,string subject,string htmlbody){
       string message;
       system.debug('toaddress...'+toaddress);
       system.debug('subject....'+subject);
       system.debug('hmtml...'+htmlbody);      
       try{ 
       //passing the parameters to this class and send the email notification        
            emailNotification.sendTheEmail(toaddress,subject,htmlbody);
            message = 'sent successfully';
        }
        catch(exception e){
            message = e.getmessage();
        }
       return message;        
   }
   
}