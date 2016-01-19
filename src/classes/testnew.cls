public class testnew {
    public lead leads{get;set;}
    public testnew(ApexPages.StandardController controller) {
        //this.leads = (lead) controller.getrecord();
    }
    public pagereference saveaction(){
        system.debug('lead values....'+leads);
        return null;
    }

}