@istest
public class MapLeadToChildLeadTest{ 
         
        
       
         static testMethod void MapLeadToChildLead(){    
             lead l=new lead(lastname='raju',company='famin',score__c=57,phone='9878785');
             insert l;
             Set<Id> Ids= new Set<Id>();
             Ids.add(l.id);
             list<lead> m1 = new List<lead>();
             m1= [select id,phone,firstname,lastname,Score__c,company from lead where id in : ids];
  
    for(lead temp : m1 )
    {
        ChildLead__c member2 = new ChildLead__c();
        member2.name = temp.firstname;
        member2.lastname__c = temp.lastname;
        member2.phone__c =  temp.phone ;
        member2.Score__c=temp.Score__c;
        member2.company__c = temp.company;
        
        System.debug(member2.company__c);
        
      upsert member2 ;
     
          }

             }
             }