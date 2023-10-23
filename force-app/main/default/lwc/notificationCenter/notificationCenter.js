import { LightningElement, wire } from 'lwc';
import showNotificationTab from '@salesforce/apex/NotificationCenterService.showMotificationTabs';

export default class NotificationCenter extends LightningElement {
    showServiceTab = false;

    @wire(showNotificationTab)
    wiredTabResult({data,error}){
        if(data){
            this.showServiceTab = data;
            console.log('Data: '+ JSON.stringify(data));
        }else{
            console.log('Error: '+ JSON.stringify(error));
        }
    }
}