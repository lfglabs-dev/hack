#[contract]
mod HackTemplate {
    use starknet::ContractAddress;
    use traits::{Into, TryInto};
    use hack_template::interfaces::{
        starknetid::{StarknetIdDispatcher, StarknetIdDispatcherTrait},
        naming::{NamingDispatcher, NamingDispatcherTrait}
    };

    struct Storage {
        starketid_contract: ContractAddress,
        naming_contract: ContractAddress,
    }

    #[external]
    fn initializer(starketid_contract: ContractAddress, naming_contract: ContractAddress) {
        if starketid_contract::read().into() == 0 {
            starketid_contract::write(starketid_contract);
        }
        if naming_contract::read().into() == 0 {
            naming_contract::write(naming_contract);
        }
    }

    #[external]
    fn example_function(starknet_id: felt252) -> felt252 {
        let starknetid_dispatcher = StarknetIdDispatcher{
            contract_address: starketid_contract::read()
        };
        let naming_dispatcher = NamingDispatcher{
            contract_address: naming_contract::read()
        };
        starknetid_dispatcher.owner_of(starknet_id).into()
    }
}
