public class LoginHistory {
    public list<sobject> getHistory1() {
        return [SELECT id from LoginHistory limit 10 ];
    }

    list<sobject> lgDetail = [SELECT UserId, LoginTime from LoginHistory limit 30];
    public list<sobject> getHistory(){
       return lgDetail;
    }

}