@isTest
public class TestRestrictContactByName {
    @isTest static void contactNamerestriction()
    {
        Contact con = new Contact(LastName='INVALIDNAME');
        Test.startTest();
          Database.SaveResult sr = Database.insert(con);
        Test.stopTest();
        
        System.assert(!sr.isSuccess());
        
    }
}