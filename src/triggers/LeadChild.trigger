trigger LeadChild on Lead (after insert,after update) {
 Set<Id> Ids= new Set<Id>();
 list<lead> m1 = new List<lead>();

 list<ChildLead__c> childToInsert = new list<ChildLead__c>();
    for(lead  m:trigger.new){
     Ids.add(m.id);
     system.debug('id2......'+Ids);
    }
 if(Ids.size()>0)
 m1= [select id,phone,firstname,lastname,Score__c,company,(select id from ChildLeads__r) from lead where id in : ids];
    for(lead temp : m1 ){ 
    system.debug('temp.ChildLeads__r.id>>>>'+temp.ChildLeads__r.size());
      if(temp.ChildLeads__r.size()==0){
        ChildLead__c member2 = new ChildLead__c();
        member2.PatentLead__c=temp.id;    
        member2.lastname__c = temp.lastname;
        member2.phone__c =  temp.phone ;
        member2.Score__c=temp.Score__c;
        member2.company__c = temp.company;
        childToInsert.add(member2);
        system.debug('i am in size=o');
        }
        
        for(childlead__c child : temp.ChildLeads__r){
        
            ChildLead__c member2 = new ChildLead__c();
            member2.PatentLead__c=temp.id;    
            member2.lastname__c = temp.lastname;
            member2.phone__c =  temp.phone ;
            member2.Score__c=temp.Score__c;
            member2.company__c = temp.company;         
            member2.id= child.id;
            system.debug('child id'+child.id);
            childToInsert.add(member2);
            system.debug('iam in size>0');
        }
        }
 upsert childToInsert ;
 }