public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String Value){
        List<List<sObject>> gSearch = 	[FIND :Value IN ALL FIELDS RETURNING Contact(lastname,firstname) , Lead(lastname)];
        return gSearch;
    }
}