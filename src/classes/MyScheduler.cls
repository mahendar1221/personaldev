global class MyScheduler implements Schedulable {
global void execute(SchedulableContext ctx) {
// The query used by the batch job.

batchcount myBatchObject = new batchcount();
Database.executeBatch(myBatchObject);




}
}