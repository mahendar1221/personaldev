@isTest
 public class testme{
 static testMethod void testDoPost(){     
     RestRequest req = new RestRequest(); 
     RestResponse res = new RestResponse();
     req.requestURI = '/Drives';
     req.httpMethod = 'POST';
     RestContext.request = req;
     RestContext.response = res;
     String results = CDrives.DoPost('maxx@gmail.com','parner','<html></html>');       
 } 
 }