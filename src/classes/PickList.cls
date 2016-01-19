public class PickList {

    public lead lead1 { get; set; }

    public lead getLead() {
        return leadobj;
    }


List<selectoption> addPickValues = new List<SelectOption>();
public string Selected { get; set; }
 ID Id = ApexPages.currentPage().getParameters().get('Id');
    lead leadObj=new lead();


    public list<selectoption> getGetValues() {
    
      Schema.DescribeFieldResult fieldResult = lead.CityCode__c.getDescribe();
         List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
              for( Schema.PicklistEntry f : ple)
               {
                   addPickValues.add(new SelectOption(f.getLabel(), f.getValue()));
               }      
                   return addPickValues;
                }
    
       
                city1__c myCS1 = city1__c.getValues('delhi');
                city1__c myCS2 = city1__c.getValues('chennai');
                //city1__c myCS3 = city1__c.getValues('hyderabad');
                city1__c myCS4 = city1__c.getValues('kolkatta');
                city1__c myCS5 = city1__c.getValues('mumbai');
                Decimal delhi = myCS1.pinnumber1__c;
                Decimal chennai = myCS2.pinnumber1__c;
               // Decimal hyderabad = myCS3.pinnumber1__c;
                Decimal kolkatta = myCS4.pinnumber1__c;
                Decimal mumbai = myCS4.pinnumber1__c;


    

    public PageReference AssignValues() {
           list<lead> n = new list<lead>();
           leadObj.id=Id;
           
           leadObj.CityCode__c = Selected;
            addPickValues.clear(); 
               
           if(leadObj.CityCode__c =='delhi') leadObj.CityPin__c=delhi;
           if(leadObj.CityCode__c =='chennai') leadObj.CityPin__c=chennai;
           //if(leadObj.CityCode__c =='hydeabad') leadObj.CityPin__c=hyderabad;
           if(leadObj.CityCode__c =='kolkata') leadObj.CityPin__c=kolkatta;
           if(leadObj.CityCode__c =='mumbai') leadObj.CityPin__c=mumbai;
           
          // list<lead> n = new list<lead>();
           
           n.add(leadObj);
           
                      insert n;
           
         return new pagereference('/'+Id);
    }


    

    
}