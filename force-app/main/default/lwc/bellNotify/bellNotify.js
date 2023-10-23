import { LightningElement } from 'lwc';

export default class BellNotify extends LightningElement {
    connectedCallback(){
    }

    handleClick(event){
        alert('You are now notified about meows !');
    }

}