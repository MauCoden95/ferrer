window.addEventListener('load', () =>{
    //PRODUCTOS


    const add_product = document.querySelector('.btn-add__product');
    const update_product = document.querySelector('.btn-update__product');
    const delete_product = document.querySelector('.btn-delete__product');
    const list_product = document.querySelector('.btn-list__product');

    const div_save_product = document.querySelector('.charge-product');
    const div_update_product = document.querySelector('.update-product');
    const div_delete_product = document.querySelector('.delete-product');
    const table = document.querySelector('.tables');

    const productList = document.querySelector('.product_list');
    const productListStock = document.querySelector('.product_list_stock');
    const productTable = document.querySelector('#product_table');
    const productTableStock = document.querySelector('#product_table_stock');

    productList.addEventListener('click', () => {
        productTable.style.display="block";
        productTableStock.style.display="none";
    })

    productListStock.addEventListener('click', () => {
        productTableStock.style.display="block";
        productTable.style.display="none";
    })

    add_product.addEventListener('click', ()=> {
        div_save_product.style.display = "block";
        div_update_product.style.display = "none";
        div_delete_product.style.display = "none";
        table.style.display = "none";
    });

    update_product.addEventListener('click', ()=> {
        div_update_product.style.display = "block";
        div_save_product.style.display = "none";
        div_delete_product.style.display = "none";
        table.style.display = "none";
    });

    delete_product.addEventListener('click', () => {
        div_delete_product.style.display = "block";
        div_save_product.style.display = "none";
        div_update_product.style.display = "none";
        table.style.display = "none";
    });

    list_product.addEventListener('click', () => {
        table.style.display = "block";
        div_save_product.style.display = "none";
        div_update_product.style.display = "none";
        div_delete_product.style.display = "none";
    });




    //CATEGORIAS


    const add_category = document.querySelector('.btn-add__category');
    const update_category = document.querySelector('.btn-update__category');
    const delete_category = document.querySelector('.btn-delete__category');
    const list_category = document.querySelector('.btn-list__category');

    const div_save_category = document.querySelector('.save-category');
    const div_update_category = document.querySelector('.update-category');
    const div_delete_category = document.querySelector('.delete-category');
    const table_category = document.querySelector('#category_table');

    add_category.addEventListener('click', ()=> {
        div_save_category.style.display = "block";
        div_update_category.style.display = "none";
        div_delete_category.style.display = "none";
        table_category.style.display = "none";
    });

    update_category.addEventListener('click', ()=> {
        div_update_category.style.display = "block";
        div_save_category.style.display = "none";
        div_delete_category.style.display = "none";
        table_category.style.display = "none";
    });

    delete_category.addEventListener('click', () => {
        div_delete_category.style.display = "block";
        div_save_category.style.display = "none";
        div_update_category.style.display = "none";
        table_category.style.display = "none";
    });

    list_category.addEventListener('click', () => {
        table_category.style.display = "block";
        div_save_category.style.display = "none";
        div_update_category.style.display = "none";
        div_delete_category.style.display = "none";
    });
})

