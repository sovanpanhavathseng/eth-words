pragma solidity ^0.8.0;

import "solidity-pack/contracts/SolidityPack.sol";

contract MyContract {
    struct Person {
        string name;
        uint256 age;
    }

    Person[] public people;

    function addPerson(string memory _name, uint256 _age) public {
        Person memory p = Person(_name, _age);
        bytes memory serialized = SolidityPack.pack(p);
        people.push(p);
    }

    function getPerson(uint256 index) public view returns (Person memory) {
        bytes memory data = SolidityPack.pack(people[index]);
        return SolidityPack.unpack(data, 0).decodePerson();
    }
}
