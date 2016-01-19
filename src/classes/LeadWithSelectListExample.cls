public class LeadWithSelectListExample {
//public id Id;
decimal hyd;
decimal bang;
decimal mum;
decimal del;
public LeadWithSelectListExample(ApexPages.StandardController controller) {
     CityCode__c city1 = CityCode__c.getValues('hyderabad');
     hyd=city1.code__c;
     //system.debug('hyd'+ hyd);
     CityCode__c city2 = CityCode__c.getValues('bangalore');
     bang=city2.code__c;
     CityCode__c city3 = CityCode__c.getValues('mumbai');
     mum=city3.code__c;
     CityCode__c city4 = CityCode__c.getValues('delhi');
     del=city4.code__c;
}
    public PageReference CancelAction() {
         AvailableValues.clear(); 
         cityAvailableValues.clear();
         return null;
        }
    public LeadWithSelectListExample()
        {
           //this.Id = ApexPages.currentPage().getParameters().get('Id');
    }
    ID Id = ApexPages.currentPage().getParameters().get('Id');
    lead leadObj=new lead();    
    List<SelectOption> AvailableValues= new List<SelectOption>();  
    List<SelectOption> cityAvailableValues= new List<SelectOption>();  
    public list<selectoption> getAvailableValues() {
         Schema.DescribeFieldResult fieldResult = lead.Employment__c.getDescribe();
         List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
              for( Schema.PicklistEntry f : ple)
                  {
                  AvailableValues.add(new SelectOption(f.getLabel(), f.getValue()));
              }      
                return AvailableValues;
    } 
     public list<selectoption> getcityAvailableValues() {
             Schema.DescribeFieldResult fieldResult = lead.city__c.getDescribe();
             List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
             for( Schema.PicklistEntry f : ple)
                 {
                  cityAvailableValues.add(new SelectOption(f.getLabel(), f.getValue()));
              }      
                return cityAvailableValues;
       }
       public string citySelectedValues { get; set; }
       public string SelectedValues { get; set; }      
       public PageReference SaveAction() {
           leadObj.id =Id;  
           leadObj.Employment__c = selectedValues;
           leadObj.city__c = cityselectedValues;
           AvailableValues.clear(); 
           cityAvailableValues.clear();
           system.debug('values.........'+leadObj.Employment__c);
           if(leadObj.Employment__c =='Self') leadObj.Score__c=8;
           if(leadObj.Employment__c =='Business') leadObj.Score__c=6;
           if(leadObj.Employment__c =='Retired') leadObj.Score__c=2;
           if(leadObj.Employment__c =='Salary') leadObj.Score__c=9;           
           if(leadObj.city__c =='hyderabad') leadObj.code__c = hyd;
           system.debug('citycode...'+leadObj.code__c);
           if(leadObj.city__c =='bangalore') leadObj.code__c = bang;
           if(leadObj.city__c =='chennai') leadObj.code__c = mum;
           if(leadObj.city__c =='delhi') leadObj.code__c = del;           
           if(leadObj.score__c > 5)
                 leadObj.Qualification_Status__c = 'Qualified';                          
           else
                 leadObj.Qualification_Status__c = 'UnQualified';       
           list<lead> n = new list<lead>();         
           n.add(leadObj);
           if(n.size()>0) update n;
           return new pagereference('/'+Id);
    }
   }