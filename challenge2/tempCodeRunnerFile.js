class Product {
    constructor(name, price, quantity) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }
}

class InventoryManagement {
    constructor() {
        // Product List
        this.products = [
            new Product("Laptop", 999.99, 5),
            new Product("Smartphone", 499.99, 10),
            new Product("Tablet", 299.99, 0),
            new Product("Smartwatch", 199.99, 3)
        ];
    }

    // Calculate the total value of the item in stock
    calculateTotalInventoryValue() {
        return this.products.reduce((total, product) => {
            return total + product.price * product.quantity;
        }, 0);
    }

    // Find the most expensive product
    findMostExpensiveProduct() {
        let mostExpensive = this.products[0];
        for (const product of this.products) {
            if (product.price > mostExpensive.price) {
                mostExpensive = product;
            }
        }
        return mostExpensive.name;
    }

    // Check if product exists
    isProductInStock(productName) {
        for (const product of this.products) {
            if (product.name.toLowerCase() === productName.toLowerCase() && product.quantity > 0) {
                return true;
            }
        }
        return false;
    }

    // Sort products by price (ascending)
    sortProductsByPriceAscending() {
        return this.products.slice().sort((a, b) => a.price - b.price);
    }

    // Sort products by quantity (descending)       
    sortProductsByQuantityDescending() {
        return this.products.slice().sort((a, b) => b.quantity - a.quantity);
    }
}


const inventory = new InventoryManagement();


const totalValue = inventory.calculateTotalInventoryValue();
console.log(`Total Inventory Value: ${totalValue.toFixed(2)}`); // 