trigger createtask on Account (after insert,after update) {
       list<task> upserttasklst = new list<task>();              
       Schema.DescribeSObjectResult r = account.sObjectType.getDescribe();
       String keyPrefix = r.getKeyPrefix();
       
       for(account a : trigger.new){                              
         if(trigger.isafter && trigger.isinsert ){
         if(a.task_number__c!=null){
                  for(integer i=0;i<a.task_number__c;i++){ 
                      task taskObj = new task();
                      taskObj.subject = a.task_value__c;
                      taskObj.type = 'Email';
                      if(keyPrefix == '001')taskObj.whatid = a.id;  
                      upserttasklst.add(taskObj);                                     
                  }
              }                              
         } 
          if(trigger.isupdate && (trigger.oldmap.get(a.id).task_value__c!=a.task_value__c || trigger.oldmap.get(a.id).task_number__c!=a.task_number__c)){
              
              if(a.task_number__c!=null){
                  for(integer i=0;i<a.task_number__c;i++){ 
                      task taskObj = new task();
                      taskObj.subject = a.task_value__c;
                      taskObj.type = 'Email';
                      if(keyPrefix == '001')taskObj.whatid = a.id;  
                      upserttasklst.add(taskObj);                                     
                  }
              }                                              
          
          }         
       }              
       if(upserttasklst.size()>0)upsert upserttasklst;
       
       }