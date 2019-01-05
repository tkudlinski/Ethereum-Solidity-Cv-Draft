pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract Institution {
    string public name;
    string public description;
    string public website;
    string public contact;
    address public creator;
    
    constructor(string memory iName, string memory iDescription, string memory iWebsite, string memory iContact) public {
        name = iName;
        description = iDescription;
        website = iWebsite;
        contact = iContact;
        creator = msg.sender;
    }
    function getCreator() public view returns (address) {
        return creator;
    }
    function getName() public view returns (string memory) {
        return name;
    }
    function getDescription() public view returns (string memory) {
        return description;
    }
    function getWebsite() public view returns (string memory) {
        return website;
    }
    function getContact() public view returns (string memory) {
        return contact;
    }
}

contract CV {
    string public name;
    string public surname;
    string public dateOfBirth;
    string public email;
    string public phone;
    string public website;
    uint public counter;
    
    struct cvItem {
        uint index;
        bool approved;
        uint fromDate;
        uint toDate;
        string description;
        string title;
        string location;
        address institutionAddr;
    }
    
    mapping (uint => cvItem) cvItems;

    
    constructor(string memory iName, string memory iSurname, string memory iDateOfBirth, string memory iEmail, string memory iPhone, string memory iWebsite) public {
        name = iName;
        surname = iSurname;
        dateOfBirth = iDateOfBirth;
        email = iEmail;
        phone = iPhone;
        website = iWebsite;
        counter = 0;
    }
    
    function addCvItem(uint iFromDate, uint iToDate, string memory iDescription, string memory iTitle, string memory iLocation) public {
        cvItem memory item = cvItems[counter];
        item.index = counter;
        item.approved = false;
        item.fromDate = iFromDate;
        item.toDate = iToDate;
        item.description = iDescription;
        item.title = iTitle;
        item.location = iLocation;
        item.institutionAddr = msg.sender;
        cvItems[counter] = item;
        counter = counter + 1;
    }
    
    function getCvItemsCounter() public view returns(uint) {
        return counter;
    }
    
    function getCvItem(uint index) public view returns(cvItem memory) {
        return cvItems[index];
    }
    
    function approveCvItem(uint index) public {
        cvItems[index].approved = true;
    }
}
