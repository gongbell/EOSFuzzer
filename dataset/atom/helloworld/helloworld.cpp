#include <eosiolib/eosio.hpp>
#include <eosiolib/print.hpp>

using namespace eosio;

class helloworld : public contract {
public:
	using contract::contract;

	[[eosio::action]] 
	void hi() {print("Hello world!");}
};

EOSIO_ABI( helloworld, (hi) )
