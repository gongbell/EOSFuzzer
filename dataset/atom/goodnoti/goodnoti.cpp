#include <eosiolib/eosio.hpp>
#include <eosiolib/print.hpp>
#include <eosiolib/asset.hpp>

using namespace eosio;

struct transfer_args {
	account_name from;
	account_name to;
	asset quantity;
	std::string memo;
};

class goodnoti : public contract {
public:
	using contract::contract;

	[[eosio::action]]
	void transfer(uint64_t sender, uint64_t receiver) {
		print("transfer called, amount = ");
		transfer_args t = unpack_action_data<transfer_args>();
		if(t.to == _self) print("yes");
		else print("no");
	}
	/*[[eosio::action]]
	void normal() {
		print("normal called");
	}*/
};

extern "C" { 
	void apply( uint64_t receiver, uint64_t code, uint64_t action ) { 
		print("goodnoti::apply - ");
		if( (code == receiver && action != ::eosio::string_to_name("transfer")) || (code == N(eosio.token) && action == ::eosio::string_to_name("transfer")) ) { 
			goodnoti thiscontract(receiver); 
			switch(action) { 
			case ::eosio::string_to_name("transfer"): 
				eosio::execute_action(&thiscontract, &goodnoti::transfer); 
				break; 
			/*case ::eosio::string_to_name("normal"): 
				eosio::execute_action(&thiscontract, &goodnoti::normal); 
				break; */
			} 
		} 
		print(" - end of goodnoti::apply");
	} 
}
