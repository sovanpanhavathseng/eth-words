pragma solidity ^0.8.0;

contract ICAP {
    function encode(bytes memory account, uint8 checksum) public pure returns (string memory) {
        require(account.length == 20, "Invalid Ethereum account address length");

        bytes memory iban = abi.encodePacked("XE", "00", checksum, account);
        uint8[37] memory digits;
        uint8 index;

        for (uint i = 0; i < iban.length; i++) {
            if (iban[i] >= 65 && iban[i] <= 90) {
                digits[index] = uint8(iban[i]) - 55;
                index++;
            } else if (iban[i] >= 48 && iban[i] <= 57) {
                digits[index] = uint8(iban[i]) - 48;
                index++;
            }
        }

        uint8 checksumResult = 0;
        for (uint8 i = 0; i < 9; i++) {
            checksumResult = checksumResult * 10 + digits[i];
            checksumResult %= 97;
        }

        checksumResult = 98 - checksumResult;
        digits[2] = checksumResult / 10;
        digits[3] = checksumResult % 10;

        bytes memory result = new bytes(34);
        for (uint i = 0; i < 34; i += 2) {
            result[i] = bytes1(digits[i/2] / 10 + 48);
            result[i+1] = bytes1(digits[i/2] % 10 + 48);
        }

        return string(result);
    }

    function validate(string memory icap) public pure returns (bool) {
        require(bytes(icap).length == 34, "Invalid ICAP length");

        bytes memory iban = new bytes(25);
        iban[0] = "X";
        iban[1] = "E";
        iban[2] = "0";
        iban[3] = "0";
        for (uint i = 0; i < 16; i++) {
            iban[i+4] = bytes(icap)[i];
        }

        uint8[37] memory digits;
        uint8 index;

        for (uint i = 0; i < iban.length; i++) {
            if (iban[i] >= 65 && iban[i] <= 90) {
                digits[index] = uint8(iban[i]) - 55;
                index++;
            } else if (iban[i] >= 48 && iban[i] <= 57) {
                digits[index] = uint8(iban[i]) - 48;
                index++;
            }
        }

        uint8 checksumResult = 0;
        for (uint8 i = 0; i < 9; i++) {
            checksumResult = checksumResult * 10 + digits[i];
            checksumResult %= 97;
        }

        return checksumResult == 1;
    }
}
