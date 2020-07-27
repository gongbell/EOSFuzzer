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

class notified : public contract {
public:
	using contract::contract;

	[[eosio::action]]
	void transfer(uint64_t sender, uint64_t receiver) {
		print("in notified::transfer - ");
		int a;
		transfer_args t = unpack_action_data<transfer_args>();
		if(t.to == _self) print("yes");
		else print("no");
	}
};

extern "C" { 
	void apply( uint64_t receiver, uint64_t code, uint64_t action ) { 
		auto self = receiver; 
		if( action == ::eosio::string_to_name("onerror")) { 
			eosio_assert(code == ::eosio::string_to_name("eosio"), "onerror action's are only valid from the \"eosio\" system account");
		} 
		if( code == self || action == ::eosio::string_to_name("onerror") || code == N(eosio.token)) { 
			notified thiscontract( self ); 
			switch( action ) { 
			case ::eosio::string_to_name( "transfer" ): 
				eosio::execute_action( &thiscontract, &notified::transfer ); 
				break; 
			} 
		} 
		print("end of notified::apply");
	} 
}
