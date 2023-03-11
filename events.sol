pragma solidity ^0.8.0;

contract MyContract {
    event NewPerson(string name, uint256 age);

    struct Person {
        string name;
        uint256 age;
    }

    Person[] public people;

    function createPerson(string memory _name, uint256 _age) public {
        Person memory newPerson = Person({
            name: _name,
            age: _age
        });

        people.push(newPerson);

        emit NewPerson(_name, _age);
    }
}
