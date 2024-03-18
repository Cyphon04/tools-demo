public class AccountUtility {
    public static void viewAnnualRevenue()
    {
        List<Account> accountsList = [SELECT Name,AnnualRevenue FROM Account];
        for(Account acc : accountsList)
        {
            String acctRev;
            acctRev = '<'+acc.Name+'> : <'+acc.AnnualRevenue+'>';
            System.debug(acctRev);
        }
        
    }
}