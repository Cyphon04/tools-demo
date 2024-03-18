public class ContactSearch {
    public static List<Contact> searchForContacts(String lastName,String mailingPostalCode)
    {
        List<Contact> conList = [SELECT lastname , MailingPostalCode FROM Contact WHERE lastname like :lastName AND MailingPostalCode = :mailingPostalCode];
        return conList;
    }
}