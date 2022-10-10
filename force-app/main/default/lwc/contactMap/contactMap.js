import { LightningElement,track} from 'lwc';

export default class ContactMap extends LightningElement {
    @track message="";
    @track modalVisibilty=false;
    handleChange(event){
        this.message=event.target.value;
        if(this.message==="Something New Is Coming"){
            this.modalVisibilty=true;
        }else{
            this.modalVisibilty=false;
        }
    }
}