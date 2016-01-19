global class batchcount implements Database.batchable<sObject>{ 
global final string Query;
//global void parentChild(){
  //     list<child__c> s = [select id,(select id from objects__r) from child__c ];
//}

//global batchcount(string s){
  //  Query=s;
       
//}
list<child__C> countToUpdate = new list<child__c>();
global iterable<sobject> start(Database.BatchableContext info){ 
     
    return [select id,(select id from objects__r) from child__c ];
   }     
   global void execute(Database.BatchableContext info, List<sobject> scope){
       for(sobject s: scope)
          {
              child__c c = (child__c)s;
              c.chilCount__c = c.objects__r.size();
              countToUpdate.add(c);
          }
       update countToUpdate;
   }     
   global void finish(Database.BatchableContext info){     
   } 
}