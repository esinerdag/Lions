public class DailyBatchScheduler implements Schedulable {
   public void execute(SchedulableContext sc) {
        // Burada Batch Apex işleminizi başlatın
        Database.executeBatch(new UpdateLeadSourceBatch());
    }
}