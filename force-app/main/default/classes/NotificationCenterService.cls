public with sharing class NotificationCenterService {
    public NotificationCenterService() {

    }

    //NotificationCenterService.showMotificationTabs
    @AuraEnabled(Cacheable=true)
    public static Boolean showMotificationTabs(){
        Id profileId = UserInfo.getProfileId();
        Profile p = [SELECT Id,Name FROM Profile WHERE Id =:profileId LIMIT 1];
        if(p.Name == 'System Administrator'){
            return true;
        }else{
            return false;
        }
    }
}