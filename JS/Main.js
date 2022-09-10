 //PRODUCTOS

    const productList = document.querySelector('.product_list');
    const productListStock = document.querySelector('.product_list_stock');
    const productTable = document.querySelector('#product_table');
    const productTableStock = document.querySelector('#product_table_stock');

     const add_product = document.querySelector('.btn-add__product');
     const update_product = document.querySelector('.btn-update__product');
     const delete_product = document.querySelector('.btn-delete__product');
     const list_product = document.querySelector('.btn-list__product');
 
     const div_save_product = document.querySelector('.charge-product');
     const div_update_product = document.querySelector('.update-product');
     const div_delete_product = document.querySelector('.delete-product');
     const table = document.querySelector('.tables');
 
     if (productList) {
        productList.addEventListener('click', () => {
            productTable.style.display="block";
            productTableStock.style.display="none";
        })   
     }


    if (productListStock) {
        productListStock.addEventListener('click', () => {
            productTableStock.style.display="block";
            productTable.style.display="none";
        })     
    }
 
     
 
   if (add_product) {
    add_product.addEventListener('click', ()=> {
        div_save_product.style.display = "block";
        div_update_product.style.display = "none";
        div_delete_product.style.display = "none";
        table.style.display = "none";
    });
   }
 
    if (update_product) {
        update_product.addEventListener('click', ()=> {
            div_update_product.style.display = "block";
            div_save_product.style.display = "none";
            div_delete_product.style.display = "none";
            table.style.display = "none";
        });   
    }
 
     
    if (delete_product) {
        delete_product.addEventListener('click', () => {
            div_delete_product.style.display = "block";
            div_save_product.style.display = "none";
            div_update_product.style.display = "none";
            table.style.display = "none";
        });
    }
 
    
    if (list_product) {
        list_product.addEventListener('click', () => {
            table.style.display = "block";
            div_save_product.style.display = "none";
            div_update_product.style.display = "none";
            div_delete_product.style.display = "none";
        });   
    }
 
     
 
 
 
 
     //CATEGORIAS
 
 
     const add_category = document.querySelector('.btn-add__category');
     const update_category = document.querySelector('.btn-update__category');
     const delete_category = document.querySelector('.btn-delete__category');
     const list_category = document.querySelector('.btn-list__category');
 
     const div_save_category = document.querySelector('.save-category');
     const div_update_category = document.querySelector('.update-category');
     const div_delete_category = document.querySelector('.delete-category');
     const table_category = document.querySelector('#category_table');
 

    if (add_category) {
        add_category.addEventListener('click', ()=> {
            div_save_category.style.display = "block";
            div_update_category.style.display = "none";
            div_delete_category.style.display = "none";
            table_category.style.display = "none";
        });
    }


     if (update_category) {
        update_category.addEventListener('click', ()=> {
            div_update_category.style.display = "block";
            div_save_category.style.display = "none";
            div_delete_category.style.display = "none";
            table_category.style.display = "none";
        });    
     }
 


     if (delete_category) {
        delete_category.addEventListener('click', () => {
            div_delete_category.style.display = "block";
            div_save_category.style.display = "none";
            div_update_category.style.display = "none";
            table_category.style.display = "none";
        });   
     }
    
     if (list_category) {
        list_category.addEventListener('click', () => {
            table_category.style.display = "block";
            div_save_category.style.display = "none";
            div_update_category.style.display = "none";
            div_delete_category.style.display = "none";
        });    
     }







     
     //PROVEEDORES
 
 
     const add_provider = document.querySelector('.btn-add__provider');
     const update_provider = document.querySelector('.btn-update__provider');
     const delete_provider = document.querySelector('.btn-delete__provider');
     const list_provider = document.querySelector('.btn-list__provider');

 
     const div_save_provider = document.querySelector('.charge-provider');
     const div_update_provider = document.querySelector('.update-provider');
     const div_delete_provider = document.querySelector('.delete-provider');
     const table_provider = document.querySelector('#provider_table');
 

    if (add_provider) {
        add_provider.addEventListener('click', ()=> {
            div_save_provider.style.display = "block";
            div_update_provider.style.display = "none";
            div_delete_provider.style.display = "none";
            table_provider.style.display = "none";
        });
    }


     if (update_provider) {
        update_provider.addEventListener('click', ()=> {
            div_update_provider.style.display = "block";
            div_save_provider.style.display = "none";
            div_delete_provider.style.display = "none";
            table_provider.style.display = "none";
        });    
     }
 


     if (delete_provider) {
        delete_provider.addEventListener('click', () => {
            div_delete_provider.style.display = "block";
            div_save_provider.style.display = "none";
            div_update_provider.style.display = "none";
            table_provider.style.display = "none";
        });   
     }
    

     if (list_provider) {
        list_provider.addEventListener('click', () => {
            table_provider.style.display = "block";
            div_save_provider.style.display = "none";
            div_update_provider.style.display = "none";
            div_delete_provider.style.display = "none";
        });    
     }
    

   
  



//CAJAS
const buttonOpen = document.querySelector('.btn-open');
const buttonClose = document.querySelector('.btn-close');
const buttonTableCaja = document.querySelector('.btn-table-caja');

const formOpenCaja = document.querySelector('#form-open-caja');
const formCloseCaja = document.querySelector('#form-close-caja');
const cajaTable = document.querySelector('#caja_table');


if (buttonOpen) {
    buttonOpen.addEventListener('click', () => {
        formOpenCaja.style.display = "block";
        formCloseCaja.style.display = "none";
        cajaTable.style.display = "none";
    });
}

if (buttonClose) {
    buttonClose.addEventListener('click', () => {
        formCloseCaja.style.display = "block";
        formOpenCaja.style.display = "none";
        cajaTable.style.display = "none";
    });
}

if (buttonTableCaja) {
    buttonTableCaja.addEventListener('click', () => {
        cajaTable.style.display = "block";
        formCloseCaja.style.display = "none";
        formOpenCaja.style.display = "none";
    });
}