pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

enum Category {NFT, DEFI, DAO, DEV}

contract YourNFT is ERC721URIStorage, Ownable {
    uint public nextTokenId;
    mapping(Category => uint) public categoryCount;
    mapping(uint => string) public tokenNames;

    string[] private hipAndCuteNames = ["Astro", "Blitz", "Cosmo", "Dynamo", "Echo", "Frost", "Glimmer", "Halo", "Ignite", "Jolt", "Karma", "Lumen", "Mystic", "Nimbus", "Oasis", "Pulse", "Quantum", "Ripple", "Spectra", "Trance", "Utopia", "Vortex", "Wisp", "Xenon", "Yonder", "Zephyr"];
    string[] private categoryImages = ["nft_image_uri", "defi_image_uri", "dao_image_uri", "dev_image_uri"];

    constructor() ERC721("YourNFT", "Y-NFT") {
    }
    
    function mint(Category _category) public onlyOwner {
        require(categoryCount[_category] < 4, "Category Limit Reached");
        _mint(msg.sender, nextTokenId);
        tokenNames[nextTokenId] = hipAndCuteNames[nextTokenId % hipAndCuteNames.length];
        _setTokenURI(nextTokenId, categoryImages[uint(_category)]);
        categoryCount[_category]++;
        nextTokenId++;
    }
}
