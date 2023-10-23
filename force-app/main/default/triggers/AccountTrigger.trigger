trigger AccountTrigger on Account (before insert, before update) {
    if(!(BypassTriggerUtility.checkBypassMain())){
        System.debug('Trigger Executing !');
        GetCurrentApexTriggerName.getApexTriggerDetails(Trigger.new);
    }else{
        System.debug('Trigger Not Executing !');
    }
}