trigger testcount1 on child__c (after insert,after update) {
      set<id> ids=new set<id>();
      object2__c cc = new object2__c ();
      for(child__c a : trigger.new)
          {
              ids.add(a.id);
            }
            
     list<object2__c> chobj = [select id,Md_Relationship__r.id from object2__c where Md_Relationship__r.id in : ids];
    
     
    for(object2__c k : chobj)
        {
         cc.id = k.id;
         
         integer i =[select count() from object2__c where Md_Relationship__r.id=:ids];
         cc.ChildTriggerCount__c=i;
        
         update cc;
        
         //child__c aa = new child__c();//parent
         //aa.id=k.Md_Relationship__r.id;
         
        
         }
        
        
}