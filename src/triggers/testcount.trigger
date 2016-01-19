trigger testcount on object2__c (after insert,after update) {
      set<id> ids=new set<id>();
      for(object2__c a : trigger.new)
          {
              ids.add(a.id);
            }
            
     integer chobj = [select count() from object2__c where id in : ids];

}