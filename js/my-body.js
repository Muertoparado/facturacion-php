import styles from "https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" assert { type: "css" };
export class myBody extends HTMLElement {
    constructor() {
        super();
        document.adoptedStyleSheets.push(styles);
    }
    async components() {
        return await (await fetch("view/my-body.html")).text();
    }
    async add(e){
        let $ = e.target;
        if ($.nodeName == "BUTTON") {
            console.log("add caja");
            this.plantilla = this.querySelector("#products").children;
            this.plantilla =  this.plantilla[ this.plantilla.length-1];
            this.plantilla =  this.plantilla.cloneNode(true);
            document.querySelector("#products").insertAdjacentElement("beforeend", this.plantilla);
            if(this.plantilla.length===0){
                console.log("render vacio");
                return this.plantilla;
                /* this.plantilla = this.querySelector("#products").children;
                document.querySelector("#products").insertAdjacentElement("beforeend", this.plantilla); */
            }
           
        }
    }
    connectedCallback() {
        this.components().then(html => {
            this.innerHTML = html;
            this.add = this.querySelector("#add").addEventListener("click", this.add.bind(this));
         
        })
    }
}
customElements.define('my-body', myBody);

