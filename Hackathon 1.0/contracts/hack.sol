// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MarketPlace{
    string public name;
    uint public productCount = 0;
    mapping(uint => Product) public products;

    struct Product {
        uint id;
        string name;
        uint price;
        address payable owner;
        bool purchased;
    }

    event ProductCreated(
        uint id,
        string name,
        uint price,
        address payable owner,
        bool purchased
    );
      event ProductedPuschased(
        uint id,
        string name,
        uint price,
        address payable owner,
        bool purchased
    );
    constructor()  {
        name = "Ethereum Marketplace";
    }

    function createProduct(string memory _name,uint _price,uint _qty) public{
        //Require a valid name
        require(bytes(_name).length > 0);
        //Require a valid price
        require(_price >0);
        //Increament product count
        require(_qty > 0);

        for(uint i=0;i<_qty;i++)
        {
            productCount ++;
            //create the product
            products[productCount] = Product(productCount, _name, _price, payable(msg.sender), false);
           //trigger an event
           emit ProductCreated(productCount, _name, _price,payable(msg.sender), false);
        }
    }
        function purchaseProduct(uint _id)public payable{
            //fetch the product
            Product memory _product = products[_id];
            //fetch the owner
            address payable _seller = _product.owner;

            require(_product.id > 0 && _product.id <= productCount);

            require(msg.value >= _product.price);

            require(!_product.purchased);

            require(_seller != msg.sender);

            _product.owner = payable(msg.sender);

            _product.purchased = true;

            products[_id] = _product;

            payable(_seller).transfer(msg.value);

            emit ProductedPuschased(productCount,_product.name,_product.price,payable(msg.sender), true);

        }
    }





