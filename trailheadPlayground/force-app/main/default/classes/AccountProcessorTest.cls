@isTest
public class AccountProcessorTest {
    @isTest
    public static void countContactTest()
    {
        // Loading the Test Data
        List<Account> accounts = new List<Account>();
        for(Integer i = 0; i < 300;i++)
        {
            accounts.add(new Account(Name='Test Account '+i));
        }
        insert accounts;
        
        List<Contact> contacts = new List<Contact>();
        List<Id> accountIds = new List<Id>();
        for(Account acc : accounts)
        {
            contacts.add(new Contact(FirstName=acc.Name,LastName='TestContact',AccountId = acc.Id));
            accountIds.add(acc.Id);
        }
        insert contacts;
        // Do the Testing
        // For Firing the Assunchronous  Function in Synchronus Manner as we know that we don't know like in what order the future method executes
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        
        // Checking the Result
        // Fetching the Result's and Checking Wheather  we got the Updated Same  Data or Not 
        List<Account> accs = [SELECT  ID , Number_of_Contacts__c FROM Account];
        for(Account acc : accs)
        {
          	   System.assertEquals(1,acc.Number_of_Contacts__c,'ERROR:');
        }
    }
}