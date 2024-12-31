public with sharing class ContactTriggerHandler {
   // if DummyJSON_Id__c is null, generate a random number between 0 and 100 and set this as the contact's DummyJSON_Id__c value
   public static void setJSONId (List<Contact> newContacts) {
    for (Contact c : newContacts) {
        if (c.DummyJSON_Id__c == null) {
            // Create a random number using formula: (Integer)(Math.random()*(max-min+1))+min
            c.DummyJSON_Id__c = String.valueOf((Integer) (Math.random() * 101));
        }
    }
}

// if DummyJSON_Id__c is less than or equal to 100, call the getDummyJSONUserFromId API
public static void startJSONCalloutGetUser (List<Contact> newContacts) {
    for (Contact c : newContacts) {
        if (Integer.valueOf(c.DummyJSON_Id__c) <= 100) {
            DummyJSONCallout.getDummyJSONUserFromId(c.DummyJSON_Id__c);
        }
    }
}

// if DummyJSON_Id__c is greater than 100, call the postCreateDummyJSONUser API
public static void startJSONCalloutCreateUser (List<Contact> newContacts) {
    for (Contact c : newContacts) {
        if (Integer.valueOf(c.DummyJSON_Id__c) > 100) {
            DummyJSONCallout.postCreateDummyJSONUser(c.Id);
        }
    }
}
}