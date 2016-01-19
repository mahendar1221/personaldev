trigger testinsert on Time_Zone__c (before insert) {
   list<Time_Zone__c> listT=new list<Time_Zone__c>();
   set<id> ids = new set<id>();
   Time_Zone__c tt = new Time_Zone__c();
    if(trigger.isinsert||trigger.isupdate){
    for(Time_Zone__c t: trigger.new){
           if(t.zones__c==null||t.zones__c==''){
               t.user_time__c=datetime.now();
               t.timeconvert__c=t.user_time__c.format('MM/dd/yyyy HH:mm:ss');    
           }
           else{
           if ((t.zones__c!='(GMT -05:00) Central Daylight Time(America/Chicago)')&&(t.zones__c!='(GMT -04:30) Eastern Daylight Time(America/New_York)') ){
               string bb =DateTime.now().format('dd/MM/yyyy h:mm a','GMT+05:30');
               system.debug('Kolkatta Time'+bb);
               t.timeconvert__c=bb; 
               t.user_time__c= datetime.now();
               //t.user_time__c = getConvertDateTime(bb);
           }   
           else if((t.zones__c!='(GMT +05:30) India Standard Time(Asia/Kolkatta)')&&(t.zones__c!='(GMT -05:00) Central Daylight Time(America/Chicago)')){
               string cc =DateTime.now().format('MM/dd/yyyy HH:mm:ss','GMT-04:30');
               system.debug('zone'+t.zones__c);
               system.debug('New_York'+cc);
               t.timeconvert__c=cc;
               t.user_time__c= datetime.now();
           }              
           else if((t.zones__c!='(GMT +05:30) India Standard Time(Asia/Kolkatta)')&&(t.zones__c!='(GMT -04:30) Eastern Daylight Time(America/New_York)')){
               string aa =DateTime.now().format('MM/dd/yyyy HH:mm:ss','GMT-05:00');
               system.debug('chicago time'+aa);
               t.timeconvert__c=aa; 
               t.user_time__c= datetime.now();
           }
           } 
     }            
     }
}