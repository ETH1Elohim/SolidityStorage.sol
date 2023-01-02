// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; //version of solidity - 0.8.7 and up \
//tell solidity which version and licensing as 1st thing

//EVM, Ethereum Virtual Machine

contract SimpleStorage {
    // this gets initialized to 0
    uint256 favoriteNumber; //automatically cast to be a storage variable because it's not defined in any of the functions
    //^favorite number is a global variable

    //A mapping is a data structure that works similar to a dictionary
    //this creates a dictionary where every string will map to a specific number
    mapping(string => uint256) public /*visibility keyword*/ nameToFavoriteNumber; 


    struct People {
        uint256 favoriteNumber;
        string name;
    }

   // uint256[] public favoriteNumbersList;
    People[] public people;

// we can save a favorite number to favoriteNumber because of the store function
    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    // view, pure function - just readable - don't change the blockchain - no gas
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }

    //calldata (can't be modified) + memory (can be modified) - variable exists temporarily, storage - exist outside of the function executing
   // strings are arrays of bytes so we need to use memory vs. uint256 is already understood to be memory
   // structs, mappings, & arrarys need to be given memory or calldata keywords when adding as parameters to diff. functions
   //Can add people to the array using this function
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name]= _favoriteNumber;
    }

}
