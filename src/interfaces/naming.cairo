
#[derive(Serde, Drop)]
struct DomainData {
    owner: starknet::ContractAddress,  // a starknet.id
    resolver: starknet::ContractAddress,
    address: starknet::ContractAddress,  // a wallet address
    expiry: felt252,  // expiration dates
    key: felt252,  // a uniq id, updated on transfer
    parent_key: felt252,  // key of parent domain
}

#[derive(Serde, Drop)]
struct Discount {
    domain_len_range: (felt252, felt252),
    days_range: (felt252, felt252),
    timestamp_range: (felt252, felt252),
    amount: felt252,
}

#[abi]
trait Naming {
    // View functions
    fn domain_to_address(domain: Array<felt252>) -> starknet::ContractAddress;

    fn domain_to_expiry(domain: Array<felt252>) -> starknet::ContractAddress;

    fn domain_to_data(domain: Array<felt252>) -> DomainData;

    fn address_to_domain(address: felt252) -> Array<felt252>;

    fn domain_to_token_id(domain: Array<felt252>) -> felt252;

    // External functions
    fn set_domain_to_address(domain: Array<felt252>, address: starknet::ContractAddress);

    fn set_domain_to_resolver(domain: Array<felt252>, resolver: starknet::ContractAddress);

    fn set_address_to_domain(domain: Array<felt252>);

    fn book_domain(domain_hash: felt252);

    fn buy(token_id: felt252, domain: felt252, days: felt252, resolver: starknet::ContractAddress, address: starknet::ContractAddress);

    fn buy_discounted(token_id: felt252, domain: felt252, days: felt252, resolver: starknet::ContractAddress, address: starknet::ContractAddress, discount_id: felt252);

    fn renew(domain: felt252, days: felt252);

    fn transfer_domain(domain: Array<felt252>, target_token_id: felt252);

    fn reset_subdomains(domain: Array<felt252>);
}
