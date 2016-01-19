public class supportsample
{
    public String city {get;set;}
    public Boolean knwCity {get;set;}
    public Boolean bool {get;set;}
        
    public void save() 
    {
        bool = false;
        if(knwCity == true)
        {
            bool = true;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'City is required when Known city is checked'));
        } 
    }
    
    public supportsample()
    {
        bool = false;
        
    }
      
}