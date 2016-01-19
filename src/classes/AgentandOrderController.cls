public class AgentandOrderController
{
    public lead Agent { get;set; }
    public String searchText { get;set; }
    public List<lead> result { get;set; }
    public Integer selected { get;set; }
    public Id AgentId { get;set; }
    public String strAgent{ get;set; }
    
    
    public List<SelectOption> Items { get;set; }
    
    public void autoRun()
    {
        Items = new List<SelectOption>();
        
        Items.add(new selectOption('cc@gmail.com', 'cc@gmail.com'));
        Items.add(new selectOption('002', '002'));
        Items.add(new selectOption('003', '003'));
        Items.add(new selectOption('004', '004'));
    }
    
    public PageReference search() 
    {
        result=[select lastname,company,email from lead where Name= :AgentId];  // not sure what you are trying to do.
        System.debug('options : '+result);
        return null;
    }
}