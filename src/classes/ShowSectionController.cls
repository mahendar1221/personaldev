public class ShowSectionController
{
    public lead acc{get;set;}
    public boolean flag{get;set;}
    public ShowSectionController()
    {
        acc = new lead();
        flag = false;
       
    }
    public void hideSectionOnChange()
    {
        if(acc.IsDuplicate__c== 'yes')                           // I have used a picklist field called Married. You can change this accourding to you
            flag = false;
        if(acc.IsDuplicate__c== 'no')
            flag = true;
    }
}