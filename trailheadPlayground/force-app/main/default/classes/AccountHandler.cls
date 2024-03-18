public class AccountHandler {
    public static Account insertNewAccount(String Name)
    {
        Account acc = new Account(Name = Name);
        	 
        try{
            insert acc;
        }
        catch(DMLException e){
            acc = null;
        }
        
        return acc;
        
    }
}