#[abi]
trait StarknetId {

    // ERC721 functions

    fn balanceOf(owner: felt252) -> u256;

    fn ownerOf(starknet_id: u256) -> starknet::ContractAddress;

    fn getApproved(starknet_id: u256) -> felt252;

    fn isApprovedForAll(owner: felt252, operator: felt252) -> bool;

    fn tokenURI(tokenId: u256) -> Array<felt252>;

    fn approve(to: felt252, starknet_id: u256);

    fn setApprovalForAll(operator: felt252, approved: felt252);

    fn transferFrom(_from: felt252, to: felt252, starknet_id: u256);

    fn safeTransferFrom(_from: felt252, to: felt252, starknet_id: u256, data : Array<felt252>);


    // starknetid view functions

    fn owner_of(starknet_id: felt252) -> starknet::ContractAddress;

    fn get_user_data(starknet_id: felt252, field: felt252) -> felt252;

    fn get_extended_user_data(starknet_id: felt252, field: felt252, length: felt252) -> Array<felt252>;

    fn get_unbounded_user_data(starknet_id: felt252, field: felt252) -> Array<felt252>;

    fn get_verifier_data(starknet_id: felt252, field: felt252, address: felt252) -> felt252;

    fn get_extended_verifier_data(starknet_id: felt252, field : felt252, length: felt252, address: felt252) -> Array<felt252>;

    fn get_unbounded_verifier_data(starknet_id: felt252, field: felt252, address: felt252) -> Array<felt252>;

    fn get_equipped_starknet_id(inft_contract: felt252, inft_id: felt252) -> felt252;


    // starknetid external functions

    fn mint(starknet_id: felt252);

    fn set_user_data(starknet_id: felt252, field: felt252, data: felt252);

    fn set_extended_user_data(starknet_id: felt252, field: felt252, data: Array<felt252>);

    fn set_verifier_data(starknet_id: felt252, field: felt252, data: felt252);

    fn set_extended_verifier_data(starknet_id: felt252, field: felt252, data: Array<felt252>);

    fn equip(inft_contract: felt252, inft_id: felt252);

    fn unequip(inft_contract: felt252, inft_id: felt252);
}
