// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.6;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

abstract contract ERC1155Base is Ownable, ERC1155 {
    using Strings for uint256;

    string public tokenURIStart;
    string public tokenURIEnd;

    mapping(uint256 => string) private _tokenURIs;

    /**
     * @dev External function to get the token URI with token Id. This function can be called by only owner.
     * @param _tokenId uint256 ID of the token to query
     * @return Returns an URI for a given token ID
     */
    function getTokenURI(uint256 _tokenId)
        external
        view
        returns (string memory)
    {
        return _tokenURIs[_tokenId];
    }

    /**
     * @dev Internal function to set the token URI.
     * @param _tokenId Id of token
     * @param _templateId Template Id to set its URI
     */
    function setTokenURI(uint256 _tokenId, uint256 _templateId) internal {
        _tokenURIs[_tokenId] = string(
            abi.encodePacked(tokenURIStart, _templateId.toString(), tokenURIEnd)
        );
    }

    /**
     * @dev Public function to set the token URI path. This function can be called by only owner.
     * @param _tokenURIStart string URI prefix to assign
     * @param _tokenURIEnd string URI back to assign
     */
    function setTokenURIPath(
        string memory _tokenURIStart,
        string memory _tokenURIEnd
    ) public onlyOwner {
        tokenURIStart = _tokenURIStart;
        tokenURIEnd = _tokenURIEnd;
    }
}
