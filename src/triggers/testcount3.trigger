trigger testcount3 on object2__c (after insert,after update) {
      set<id> ids=new set<id>();
      child__c cc = new child__c ();
      for(object2__c a : trigger.new)
          {
              ids.add(a.Md_Relationship__r.id);
            }
             
     list<child__c> child = [SELECT Id, (SELECT id FROM objects__r)FROM child__c WHERE id in:ids];
      // list<object2__c> child = [select id,Md_Relationship__r.id from object2__c where id in: ids];
     
    for(child__c k : child)
        {
        
         cc.id = k.id;
         system.debug('id.......'+k.id);
         
         integer i =[select count() from object2__c where id in:ids];
       
         cc.TriggerCount__c=i;
         system.debug('count....'+i);
         upsert cc;
        
         //child__c aa = new child__c();//parent
         //aa.id=k.Md_Relationship__r.id;
         
        
         }
        
        
}