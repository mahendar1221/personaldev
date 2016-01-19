<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Package_Template_Signer_Company</fullName>
        <field>Company__c</field>
        <formula>IF(ISPICKVAL(Type__c, &apos;Contact&apos;), Contact__r.Account.Name, 
IF(ISPICKVAL(Type__c, &apos;Lead&apos;), Lead__r.Company, 
IF(ISPICKVAL(Type__c, &apos;User&apos;), User__r.CompanyName, Company__c)))</formula>
        <name>Package Template Signer Company</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Package_Template_Signer_Email</fullName>
        <field>Email__c</field>
        <formula>IF(ISPICKVAL(Type__c, &apos;Contact&apos;), Contact__r.Email, 
IF(ISPICKVAL(Type__c, &apos;Lead&apos;), Lead__r.Email, 
IF(ISPICKVAL(Type__c, &apos;User&apos;), User__r.Email,
 Email__c)))</formula>
        <name>Package Template Signer Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Package_Template_Signer_First_Name</fullName>
        <field>First_Name__c</field>
        <formula>IF(ISPICKVAL(Type__c, &apos;Contact&apos;), Contact__r.FirstName, 
IF(ISPICKVAL(Type__c, &apos;Lead&apos;), Lead__r.FirstName, 
IF(ISPICKVAL(Type__c, &apos;User&apos;), User__r.FirstName,
 First_Name__c)))</formula>
        <name>Package Template Signer First Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Package_Template_Signer_Last_Name</fullName>
        <field>Last_Name__c</field>
        <formula>IF(ISPICKVAL(Type__c, &apos;Contact&apos;), Contact__r.LastName, 
IF(ISPICKVAL(Type__c, &apos;Lead&apos;), Lead__r.LastName, 
IF(ISPICKVAL(Type__c, &apos;User&apos;), User__r.LastName, Last_Name__c)))</formula>
        <name>Package Template Signer Last Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Package_Template_Signer_Name</fullName>
        <field>Name</field>
        <formula>IF(ISPICKVAL(Type__c, &apos;Placeholder&apos;),Id, First_Name__c &amp; &apos; &apos; &amp; Last_Name__c)</formula>
        <name>Package Template Signer Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Package_Template_Signer_Phone</fullName>
        <field>Phone__c</field>
        <formula>IF(ISPICKVAL(Type__c, &apos;Contact&apos;), Contact__r.Phone, 
IF(ISPICKVAL(Type__c, &apos;Lead&apos;), Lead__r.Phone, 
IF(ISPICKVAL(Type__c, &apos;User&apos;), User__r.Phone, Phone__c)))</formula>
        <name>Package Template Signer Phone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Package_Template_Signer_Title</fullName>
        <field>Title__c</field>
        <formula>IF(ISPICKVAL(Type__c, &apos;Contact&apos;), Contact__r.Title, 
IF(ISPICKVAL(Type__c, &apos;Lead&apos;), Lead__r.Title, 
IF(ISPICKVAL(Type__c, &apos;User&apos;), User__r.Title, Title__c)))</formula>
        <name>Package Template Signer Title</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Populate Package Template Signer Information</fullName>
        <actions>
            <name>Package_Template_Signer_Company</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Package_Template_Signer_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Package_Template_Signer_First_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Package_Template_Signer_Last_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Package_Template_Signer_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Package_Template_Signer_Phone</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Package_Template_Signer_Title</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Populate the fields from related object</description>
        <formula>NOT(ISPICKVAL(Type__c, &apos;&apos;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
