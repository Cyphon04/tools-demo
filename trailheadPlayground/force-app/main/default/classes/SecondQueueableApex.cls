public class SecondQueueableApex implements Queueable {
    public Integer counter;

    public SecondQueueableApex (Integer counter) {
       this.counter= counter;
    }

    public void execute(QueueableContext context) {
        Account a = new Account(Name='Aaccount'+counter,Phone='(415) 555-1212');
        insert a;      
    }
    
    @future(callout=true)
    public static void executeFuture() {
        for(Integer counter=1;counter<3;counter++) {
            System.enqueueJob(new SecondQueueableApex(counter));
        }
    }
}