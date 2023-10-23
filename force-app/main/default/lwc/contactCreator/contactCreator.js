import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import FIRST_NAME from '@salesforce/schema/Contact.FirstName';
import LAST_NAME from '@salesforce/schema/Contact.LastName';
import EMAIL from '@salesforce/schema/Contact.Email';

export default class ContactCreator extends LightningElement {
    @api objectApiName = CONTACT_OBJECT;
    @api fields=[FIRST_NAME, LAST_NAME, EMAIL];

    handleSuccess(event){
        let toast = new ShowToastEvent({
            title: 'Contact Created',
            message: 'Record ID: '+ event.detail.Id,
            variant: 'success'
        });
        this.dispatchEvent(toast);
    }
}