@isTest
public class theConvertChildLeadToAccountTests {

    public static testMethod void testConvertChildLeadToAccount() {
        PageReference pageref = Page.SampleInsertChildToLead;
        Test.setCurrentPage(pageref);
      
        thecontroller controller = new thecontroller();
        String nextPage = controller.save().getUrl();
        
        controller = new thecontroller(); 
        controller.setLastName('lastname');
        controller.setFirstName('firstname');
       // controller.setCompany('acme');
        controller.setEmail('firstlast@acme.com');
        nextPage = controller.save().getUrl();
       
        Lead[] leads = [select id, email from lead where Company = 'acme'];
        //System.assertEquals('firstlast@acme.com', leads[0].email);
        
        }
        }