trigger dateTimeConvertion on Time_Zone__c (before update) {
    set<id> ids = new set<id>();
    Time_Zone__c tid =new Time_Zone__c();
    list<Time_Zone__c> obj = new list<Time_Zone__c >();
    for(Time_Zone__c  t : trigger.new){
         obj.add(new Time_Zone__c(id=t.id)); 
    }   
    
    //if(ids.size()>0) 
     if(trigger.isinsert){   
      for(Time_Zone__c t : obj ){
        if(t.zones__c=='(GMT -05:00) Central Daylight Time(America/Chicago)' ){
            system.debug('zones...'+t.zones__c);
            string aa =DateTime.now().format('MM/dd/yyyy HH:mm:ss','America/Chicago');
            system.debug('chicago time'+aa);
            t.timeconvert__c=aa;
            system.debug('tid.timeconvert__c'+t.timeconvert__c);
    }
    }
    }   
         
            
}