@isTest(seealldata=true)
public class LeadWithSelectListExampleTests {

    public static testMethod void testQualification() {
        lead lobj = new lead(lastname='jeff ric',company='force',status='Open - Not Contacted',Employment__c='self',city__c='hyderabad');
        insert lobj;
        test.starttest();
        apexpages.currentpage().getparameters().put('id',lobj.id) ;
        Apexpages.StandardController sc = new Apexpages.standardController(lobj);
        LeadWithSelectListExample controller = new LeadWithSelectListExample(sc);
        controller.SaveAction();
        controller.getAvailableValues();
        controller.getcityAvailableValues();
        controller.CancelAction();
        test.stoptest();
        
        }
        }