#include <eosiolib/eosio.hpp>
#include <eosiolib/print.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/transaction.h>

using namespace eosio;

class random : public contract {
public:
	using contract::contract;

	[[eosio::action]] 
	void num() {
		print(tapos_block_num());
	}

	[[eosio::action]]
	void prefix() {
		print(tapos_block_prefix());
	}

	[[eosio::action]]
	void maybe(bool b) {
		if(b) print(tapos_block_num());
		else print("nothing");
	}

	[[eosio::action]]
	void hello() {
		print("hello world");
	}

	[[eosio::action]]
	void token() {
		print(tapos_block_prefix());
		action(
			permission_level{_self, N(active)},
			N(eosio.token),
			N(transfer),
			std::make_tuple(
				_self,
				_self,
				asset(0, symbol_type(S(4, EOS))), 
				std::string("random::token")
			)
		).send();
	}

	[[eosio::action]]
	void getnow() {
		logfile("random::getnow calling logfile");
	}
};

EOSIO_ABI( random, (num)(prefix)(maybe)(hello)(token)(getnow) )
