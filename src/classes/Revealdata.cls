public class Revealdata {
    id accountid = apexpages.currentpage().getparameters().get('id');
    public account getAccounts() {
        account a = new account();
        a= [select name,type,billingcity from account where id=:accountid];
        return a;
    }

}