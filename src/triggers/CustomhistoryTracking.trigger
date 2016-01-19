trigger CustomhistoryTracking on Lead (after update) {
    
    Custom_Lead_History__c history = new Custom_Lead_History__c();
    list<Custom_Lead_History__c> lis = new list<Custom_Lead_History__c>();
    set<id> ids = new set<id>();
    lead oldValue = new lead();
    string s;
    for(lead l:trigger.new){
        list<lead> lobj = new list<lead>(); 
        ids.add(l.id); 
        oldValue = System.Trigger.oldMap.get(l.Id);  
        lobj = [select id,name,(select id,name from Custom_Lead_History__r ) from lead where id in:ids];
        for(lead ll : lobj){
        for(Custom_Lead_History__c his:ll.Custom_Lead_History__r){
        
        //history.id=his.id;
        history.LookUpLead__c=ll.id;
        system.debug('oldvalue.rating'+oldvalue.rating);
        history.Action__c='lead rating has been changed from  '+oldvalue.rating+'  to  '+l.rating+ '  on  '+system.now();  
        system.debug('i am in update');
        }
        }
        lis.add(history);  
        insert lis ;  
    }
    
          
 }