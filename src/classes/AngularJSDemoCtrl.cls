global with sharing class AngularJSDemoCtrl {
 
 
public class Accountwrap {
 
Accountwrap() {
 
Website = '';
AccountSource = '';
Phone = '';
Type = '';
}
 
public string id;
public string name;
public string Website;
public string AccountSource;
public string Phone;
public string Type;
 
 
}
 
global static String getlstAccount() {
 
List < Accountwrap > lstwrap = new List < Accountwrap > ();
List < account > lstacc = [SELECT Id, Name, Phone, Type, Website, AccountSource
FROM Account
];
 
for (Account a: lstacc) {
 
Accountwrap awrap = new Accountwrap();
awrap.id = a.id;
awrap.name = a.name;
if (a.Website != null) {
awrap.Website = a.Website;
}
if (a.Phone != null) {
awrap.Phone = a.Phone;
}
if (a.Type != null) {
awrap.Type = a.Type;
}
if (a.AccountSource != null) {
awrap.AccountSource = a.AccountSource;
}
lstwrap.add(awrap);
 
}
 
return JSON.serialize(lstwrap);
 
}
 
}