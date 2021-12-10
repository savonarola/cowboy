REBAR := rebar3

.PHONY: all
all: compile

compile:
	$(REBAR) compile

.PHONY: clean
clean: distclean

.PHONY: distclean
distclean:
	@rm -rf _build erl_crash.dump rebar3.crashdump rebar.lock

.PHONY: xref
xref:
	$(REBAR) xref

.PHONY: eunit
eunit: compile
	$(REBAR) eunit verbose=truen

.PHONY: clean-example-deps
clean-example-deps:
	@rm -rf examples/*/deps examples/*/_rel examples/*/erlang.mk

.PHONY: ct
ct: compile clean-example-deps
	$(REBAR) as test ct -v

cover:
	$(REBAR) cover

.PHONY: dialyzer
dialyzer:
	$(REBAR) dialyzer

