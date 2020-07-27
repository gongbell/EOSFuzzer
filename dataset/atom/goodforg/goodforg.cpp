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

class goodforg : public contract {
public:
	using contract::contract;

	[[eosio::action]]
	void transfer(uint64_t sender, uint64_t receiver) {
		uint64_t a;
		transfer_args t = unpack_action_data<transfer_args>();
		if(t.to != _self) return;
		else a = t.to;
		print(a);
	}
};

extern "C" { 
	void apply( uint64_t receiver, uint64_t code, uint64_t action ) { 
		if( (code == receiver && action != ::eosio::string_to_name("transfer")) || (code == N(eosio.token) && action == ::eosio::string_to_name("transfer")) ) { 
			goodforg thiscontract(receiver); 
			switch(action) { 
			case ::eosio::string_to_name("transfer"): 
				eosio::execute_action(&thiscontract, &goodforg::transfer); 
				break; 
			} 
		} 
	} 
}
