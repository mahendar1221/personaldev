trigger OverrideRecordType  on Account (before insert,before update) {
    list<recordtype> listr = [select name,id from recordtype where  sobjecttype='account' ];       
    for(account a:trigger.new){
        string s=a.PickList_Types__c;
        system.debug('s'+s);
        for(recordtype r : listr){        
           if(s==r.name){       
               a.recordtypeid=r.id;
               system.debug('a.recordtypeid'+a.recordtypeid);
           }
        }
    }
}