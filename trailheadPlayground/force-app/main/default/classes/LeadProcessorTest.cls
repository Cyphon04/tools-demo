@isTest
public class LeadProcessorTest {
    @isTest
    public static void testBatchClass()
    {
        // Loading the Test Data
        List<Lead> leads = new List<Lead	>();
        for(Integer i = 0; i < 200;i++)
        {
            leads.add(new lead(LastName='Connock ',Company='Salesforce'));
        }
        insert leads;
        // Do the Testing
        // For Firing the Assunchronous  Function in Synchronus Manner as we know that we don't know like in what order the future method executes
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp,200);
        Test.stopTest();
        
        // Checking the Result
        // Fetching the Result's and Checking Wheather  we got the Updated Same  Data or Not 
        List<Lead> updatedLeads = [SELECT  ID FROM Lead WHERE LeadSource = 'Salesforce'];
        System.assertEquals(0,updatedLeads.size(),'Error');
    }
}