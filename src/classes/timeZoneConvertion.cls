public class timeZoneConvertion {
    Time_Zone__c time1 = new Time_Zone__c(); 
    public timeZoneConvertion(ApexPages.StandardController controller) {

    }
    public Time_Zone__c TimeZone1{get;set;}
    public Time_Zone__c gettimezone(){
    
    return time1;
    }
    public list<selectoption> getAvailableValues() {
        Schema.DescribeFieldResult fieldResult = Time_Zone__c.zones__c.getDescribe();
         List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
              for( Schema.PicklistEntry f : ple)
               {
                Values.add(new SelectOption(f.getLabel(), f.getValue()));
              }      
                return Values;
        return null;
    }

    list<selectoption> values = new list<selectoption>();
    public string SelectedValues { get; set; }
    
    public void saveToConvert(){
        
        time1.zones__c=SelectedValues;
        values.clear();
        
        if(time1.zones__c=='(GMT +05:30) India Standard Time(Asia/Kolkatta)'){
            string aa =DateTime.now().format('MM/dd/yyyy HH:mm:ss','Asia/Kolkatta');
            system.debug('chicago time'+aa);
            time1.timeconvert__c=aa;
            string bb = time1.user_time__c.format('h:mm:ss ');
            
                //time1.timeconvert__c=bb;       
                        
        }
        if(time1.zones__c=='(GMT -04:30) Eastern Daylight Time(America/New_York)'){
            string aa =DateTime.now().format('MM/dd/yyyy HH:mm:ss','America/New_York');
            system.debug('chicago time'+aa);
            //time1.timeconvert__c=aa;
             string bb = time1.user_time__c.format('h:mm:ss ');
            
                time1.timeconvert__c=bb;       
            
        }
        if(time1.zones__c=='(GMT -05:00) Central Daylight Time(America/Chicago)'){
            string aa =DateTime.now().format('MM/dd/yyyy HH:mm:ss','America/Chicago');
            system.debug('chicago time'+aa);
            //time1.timeconvert__c=aa;
             string bb = time1.user_time__c.format('h:mm:ss ');
            
                time1.timeconvert__c=bb;       
            
        }
        insert time1;
    }
}