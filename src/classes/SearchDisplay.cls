public class SearchDisplay {
    SearchDisplay(){}
   
    public boolean parent{get;set;}
    public boolean child{get;set;}
    public string SearchEmail{set;get;}
    lead obj = new lead();
    public List<Lead> results;
    public id cid {get;set;}
    public SearchDisplay(ApexPages.StandardController controller) {
         parent=false;
         child=false;       
    }
   
       
    
    public list<lead> getDisplayRecords(){
        return results;
    }
    public pagereference search(){
        parent=true;
        
        if(SearchEmail==null ||SearchEmail==''){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.error,'Please Enter a Valid Search Keyword');//Same old drama 
            ApexPages.addMessage(myMsg); 
            
            //SearchEmail.adderror(myMsg);
        }
        
        else if(SearchEmail.length()<=3 ){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.warning,'enter more than three characters');//Same old drama 
            ApexPages.addMessage(myMsg); 
        } 
        else
            results = (List<Lead>)[FIND:SearchEmail IN ALL FIELDS RETURNING Lead(id,name,Company,Email,Phone,Status) ][0];
            return null;
        
    }
    list<childlead__c> ch =new list<childlead__c>();
    
   
    public list<childlead__c> getchildrecords(){
       
        return ch;
    }
     public void childAction() {
        child=true;
        system.debug('id......'+cid);
        ch = [select id,name,company__c,score__c,PatentLead__r.id from childlead__c where PatentLead__r.id =:cid ];        
        
    }
    
}