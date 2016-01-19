trigger secondTimeCovert on Time_Zone__c (before insert) {
    if(trigger.isinsert||trigger.isupdate){
        for(Time_Zone__c t: trigger.new){
            if(t.zones__c!=null||t.zones__c!=''){
                string selectedTimeZone = t.zones__c;
                system.debug('t.zones__c'+selectedTimeZone);
                string a =selectedTimeZone.substringafter('Time(');
                system.debug(a);
                a=a.substringbefore(')');
                system.debug('time zome from string methods'+a);          
                
            if(t.customer_time__c!=null && t.Company_Time__c==null){                    
                string tt =t.customer_time__c.format('dd/MM/yyyy h:mm a','a');  
                system.debug(tt);              
                datetime dt = datetime.parse(tt);
                //t.customer_time__c=dt;
               
                string m = dt.format('dd/MM/yyyy h:mm a','America/Los_Angeles');
                 system.debug(m);
                t.Company_Time__c = datetime.parse(m);
                }
            if(t.Company_Time__c!=null && t.customer_time__c==null){
                string t1 =t.Company_Time__c.format('dd/MM/yyyy h:mm a','America/Los_Angeles');                
                datetime dt = datetime.parse(t1);
                string m = dt.format('dd/MM/yyyy h:mm a','a');
                t.customer_time__c = datetime.parse(m);
                }
                
           
            }
        }                
    }

}