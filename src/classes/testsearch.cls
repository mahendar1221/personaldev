public class testsearch {

    public String leadsearch { get; set; }
    
    public void search(){
    if(leadsearch.length()<=2){
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.error,'Please Enter a Valid Search Keyword');//Same old drama 
        ApexPages.addMessage(myMsg); 
       
    }
    }
}