public class UserDetail {

    public String getLoginUserName() {
        return us.Username;
    }


    public datetime getLastviewedDate1() {
        return us.LastViewedDate;
    }


   String result = UserInfo.getname();

    public datetime getLoginDate() {
        return us.LastLoginDate;
    }


    public string getUid() {
        return us.name;
    }
    user us = [select id,name,phone,LastLoginDate,LastViewedDate,Username from user ] ;
    public UserDetail(){
        
    }
}