//PRODUCTOS
const productList = document.querySelector('.product_list');
const productListStock = document.querySelector('.product_list_stock');
const productTable = document.querySelector('#product_table');
const productTableStock = document.querySelector('#product_table_stock');

productList.addEventListener('click', () => {
    productTable.style.display = "block";
    productTableStock.style.display = "none";

 
    
})

productListStock.addEventListener('click', () => {
    productTableStock.style.display = "block";
    productTable.style.display = "none";
    
})