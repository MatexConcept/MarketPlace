// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.27;

contract MarketPlace {
    address public owner;
    address public buyer;

    enum OrderStatus {
        None,
        Created,
        Pending,
        Sold
    }

    struct Products {
        string name;
        uint16 price;
        OrderStatus status;
    }

     Products [] public products;
    mapping(uint256 => bool) public isSold;

    event ProductCreated(string indexed name, uint16 price);
    event ProductSold(string indexed name, uint16 price, address buyer);

    constructor() {
        owner = msg.sender;
    }

    function product(string memory _name, uint16 _price) external {
        require(msg.sender != address(0), "Zero address is not allowed");

         Products  memory newProduct;
        newProduct.name = _name;
        newProduct.price = _price;
        newProduct.status = OrderStatus.Created;

        products.push(newProduct);

        emit  ProductCreated(_name, _price);
    }

    function productPurchase(uint8 _index) external {
        require(msg.sender != address(0), "Zero address is not allowed");
        require(_index < products.length, "Out of bound!");
        require(!isSold[_index], "Product  sold");

        products[_index].status = OrderStatus.Sold;
        isSold[_index] = true;
        buyer = msg.sender;

        emit ProductSold(products[_index].name, products[_index].price, msg.sender);
    }
}