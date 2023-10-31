import { LightningElement} from 'lwc';
import searchSalesAgents from '@salesforce/apex/SaController.searchSalesAgents';
export default class SaSerchNameL extends LightningElement {
    searchWord;
    saDetails;
    


    seacrhHandler(event) {
        this.searchWord = event.target.value;
        searchSalesAgents, ({ searchKey: '$searchWord' })
        .then(result=>{
            console.log(result);
            this.saDetails=result;
        })
        .catch(error=>{
            console.log(error);
        })


    }
}
