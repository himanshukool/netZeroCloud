public with sharing class NotificationUtility {
    public NotificationUtility() {}

    public Contact contactObj;
    public String subject;
    public String message;

    public NotificationUtility setContact(Contact con){
        this.contactObj = con;
        return this;
    }

    public NotificationUtility setSubject(String sub){
        this.subject = sub;
        return this;
    }

    public NotificationUtility setMessage(String message){
        this.message = message;
        return this;
    }

    public Notification__c createInstance(){
        Notification__c notify = new Notification__c();
        notify.Contact__c = this.contactObj.Id;
        notify.Message__c = this.message;
        notify.Subject__c = this.subject;

        return notify;
    }

    public List<ReturnResult> publish(){
        List<Notification__c> insertNotifyList = new List<Notification__c>();
        List<ReturnResult> returnResultList = new List<ReturnResult>();

        Notification__c notify = new Notification__c();
        notify.Contact__c = this.contactObj.Id;
        notify.Message__c = this.message;
        notify.Subject__c = this.subject;
        insertNotifyList.add(notify);

        Database.SaveResult[] srList = Database.insert(insertNotifyList, false);

        for(Database.SaveResult sr : srList){
            if (sr.isSuccess()) {
                ReturnResult r = new ReturnResult();
                r.isSuccess = true;
                r.isFailure = false;
                r.recordId = sr.getId();
                r.resultMessage = 'SUCCESS';
                returnResultList.add(r);
            }
            else {              
                for(Database.Error err : sr.getErrors()) {
                    ReturnResult r = new ReturnResult();
                    r.isSuccess = false;
                    r.isFailure = true;
                    r.recordId = sr.getId();
                    r.resultMessage = err.getMessage();
                    returnResultList.add(r);
                }
            }
        }
        return returnResultList;
    }

    public List<ReturnResult> publish(List<Notification__c> getNotificationsToProceedList){
        List<ReturnResult> returnResultList = new List<ReturnResult>();

        if(getNotificationsToProceedList.size() > 0){
            Database.SaveResult[] srList = Database.insert(getNotificationsToProceedList, false);

            for(Database.SaveResult sr : srList){
                if (sr.isSuccess()) {
                    ReturnResult r = new ReturnResult();
                    r.isSuccess = true;
                    r.isFailure = false;
                    r.recordId = sr.getId();
                    r.resultMessage = 'SUCCESS';
                    returnResultList.add(r);
                }
                else {              
                    for(Database.Error err : sr.getErrors()) {
                        ReturnResult r = new ReturnResult();
                        r.isSuccess = false;
                        r.isFailure = true;
                        r.recordId = sr.getId();
                        r.resultMessage = err.getMessage();
                        returnResultList.add(r);
                    }
                }
            }
        }
        return returnResultList;
    }
}