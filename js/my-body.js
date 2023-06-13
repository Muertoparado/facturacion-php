
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
            this.plantilla = this.querySelector("#products").children;
            this.plantilla =  this.plantilla[ this.plantilla.length-1];
            this.plantilla =  this.plantilla.cloneNode(true);
            document.querySelector("#products").insertAdjacentElement("beforeend", this.plantilla);
        }
    }
    send(e){
        let input = document.querySelectorAll("input");
        let fromInput = 7, fromProduct = 4;
        let info = {}, producto = {}, lista = {}, data = {}, count = 0;
        producto.product = [];
        input.forEach((val, id) => {
            if (id <= fromInput) {
                info[val.name] = val.value;
            } else if (count <= fromProduct) {
                lista[val.name] = val.value;
                count++;
                if (count == fromProduct) {
                producto.product.push(lista);
                lista = {};
                count = 0;
                }
            }
        });
        data.info = info;
        data.producto = producto.product;
    }
    connectedCallback() {
        this.components().then(html => {
            this.innerHTML = html;
            this.add = this.querySelector("#add").addEventListener("click", this.add.bind(this));
            this.send = this.querySelector("#send").addEventListener("click", this.send.bind(this));
        })
    }
}
customElements.define('my-body', myBody);
