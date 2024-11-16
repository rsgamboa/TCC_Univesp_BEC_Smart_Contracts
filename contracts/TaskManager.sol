// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalAttachmentManager {
    struct Attachment {
        uint256 id;
        string name;
        string hash;
        address uploader;
        uint256 timestamp;
        bool isSeized;
    }

    Attachment[] public attachments;
    uint256 public nextId;
    address public admin;

    event AttachmentUploaded(uint256 id, string name, string hash, address uploader, uint256 timestamp);
    event AttachmentSeized(uint256 id, address seizedBy);
    event AttachmentReleased(uint256 id, address releasedBy);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function uploadAttachment(string memory _name, string memory _hash) public {
        attachments.push(Attachment({
            id: nextId,
            name: _name,
            hash: _hash,
            uploader: msg.sender,
            timestamp: block.timestamp,
            isSeized: false
        }));
        emit AttachmentUploaded(nextId, _name, _hash, msg.sender, block.timestamp);
        nextId++;
    }

    function seizeAttachment(uint256 _id) public onlyAdmin {
        require(_id < nextId, "Attachment does not exist");
        Attachment storage attachment = attachments[_id];
        require(!attachment.isSeized, "Attachment is already seized");
        attachment.isSeized = true;
        emit AttachmentSeized(_id, msg.sender);
    }

    function releaseAttachment(uint256 _id) public {
        require(_id < nextId, "Attachment does not exist");
        Attachment storage attachment = attachments[_id];
        require(attachment.isSeized, "Attachment is not seized");
        require(msg.sender == admin || msg.sender == attachment.uploader, "Only admin or uploader can release the attachment");
        attachment.isSeized = false;
        emit AttachmentReleased(_id, msg.sender);
    }

    function getAttachment(uint256 _id) public view returns (Attachment memory) {
        require(_id < nextId, "Attachment does not exist");
        return attachments[_id];
    }

    function getAttachments() public view returns (Attachment[] memory) {
        return attachments;
    }
}