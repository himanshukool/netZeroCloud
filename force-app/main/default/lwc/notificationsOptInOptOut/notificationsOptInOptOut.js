import { LightningElement } from 'lwc';

export default class NotificationsOptInOptOut extends LightningElement {
    contact = null;
    contactId = null;

    handleValueSelectedOnContact(event){
        this.contact = event.detail;
        this.contactId = this.contact.id;
        console.log('Data selected: '+ JSON.stringify(this.contact));
        console.log('Data selected id: '+ this.contactId);
    }

    handleDeselectOnContact(event){
        this.contact = event.detail;
        this.contactId = null;
        console.log('Data deselected: '+ JSON.stringify(this.contact));
        console.log('Data deselected id: '+ this.contactId);
    }
}