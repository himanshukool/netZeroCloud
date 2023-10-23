public with sharing class BypassTriggerUtility {

    private static Bypass_Trigger__c defaultInstance{
        get{
            if(defaultInstance == null){
                defaultInstance = new Bypass_Trigger__c();
            }
            return defaultInstance;
        }
        private set;
    }

    private static Bypass_Trigger__c userInstance{
        get{
            if(userInstance == null){
                userInstance = new Bypass_Trigger__c();
            }
            return userInstance;
        }
        private set;
    }

    private static Bypass_Trigger__c profileInstance{
        get{
            if(profileInstance == null){
                profileInstance = new Bypass_Trigger__c();
            }
            return profileInstance;
        }
        private set;
    }

    public BypassTriggerUtility() {}

    public static void createNewExistingDefaultBypassEntry(Boolean byPassCheck){
        if(Bypass_Trigger__c.getOrgDefaults().Id == null){
            Bypass_Trigger__c defaultCS = new Bypass_Trigger__c();
            defaultCS.Bypass__c = byPassCheck;
            insert defaultCS;
        }else{
            Bypass_Trigger__c defaultCS = new Bypass_Trigger__c(Id = Bypass_Trigger__c.getOrgDefaults().Id);
            defaultCS.Bypass__c = byPassCheck;
            update defaultCS;
        }
    }

    public static void createNewExistingProfileBypassEntry(String profileName, Boolean byPassCheck){
        Profile p = [SELECT Id,Name FROM Profile WHERE Name =: profileName LIMIT 1];

        if(Bypass_Trigger__c.getInstance(p.Id).Id == null){
            Bypass_Trigger__c profileCS = new Bypass_Trigger__c();
            profileCS.SetupOwnerId = p.Id;
            profileCS.Bypass__c = byPassCheck;
            insert profileCS;
        }else{
            Bypass_Trigger__c profileCS = new Bypass_Trigger__c(Id = Bypass_Trigger__c.getInstance(p.Id).Id);
            profileCS.Bypass__c = byPassCheck;
            update profileCS;
        }
    }

    public static void createNewExistingUserBypassEntry(Id userId, Boolean byPassCheck){
        if(Bypass_Trigger__c.getInstance(userId).Id == null){
            Bypass_Trigger__c userCS = new Bypass_Trigger__c();
            userCS.SetupOwnerId = userId;
            userCS.Bypass__c = byPassCheck;
            insert userCS;
        }else{
            Bypass_Trigger__c userCS = new Bypass_Trigger__c(Id = Bypass_Trigger__c.getInstance(userId).Id);
            userCS.Bypass__c = byPassCheck;
            update userCS;
        }
    }

    public static Boolean checkBypassMain(){
        defaultInstance = Bypass_Trigger__c.getOrgDefaults();
        profileInstance = Bypass_Trigger__c.getInstance(UserInfo.getProfileId());
        userInstance = Bypass_Trigger__c.getInstance(UserInfo.getUserId());
        if(defaultInstance != null && defaultInstance.Bypass__c == true){
            return true;
        }else if(profileInstance != null && profileInstance.Bypass__c == true){
            return true;
        }else if(userInstance != null && userInstance.Bypass__c == true){
            return true;
        }else{
            return false;
        }
    }
}