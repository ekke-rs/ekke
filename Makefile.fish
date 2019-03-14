#! /usr/bin/fish


set --global libs     \
	                   \
	ekke_config        \
	ekke_io            \
	ekke_merge         \
	ekke_merge_derive  \


set --global back_execs    \
	                        \
	ekke_core               \


set --global wasm_execs    \
	                        \
	ekke_core_frontend      \


set --global all_execs   $back_execs $wasm_execs
set --global crates      $back_execs $wasm_execs $libs

set --global server      ekke_core



function build

	for crate in $wasm_execs

		pushd $crate

			echo "wasm-pack build $argv[1] $crate"

			wasm-pack build $argv[1] --target no-modules; or exit 1

		popd

	end

	for crate in $back_execs

		pushd $crate

			echo "Build $argv[1] $crate"

			cargo build $argv[1] ; or exit 1

		popd

	end

end


function check

	for crate in $all_execs

		pushd $crate

			echo "Check $crate"

			cargo check; or exit 1

		popd

	end

end


function run

	build; or exit 1

	pushd $server

		echo "Run $argv[1] Ekke Server"
		cargo run $argv[1]

	popd

end


# When running cargo commands on an executable, cargo yaml won't be called on it's
# dependencies. We have a custom wrapper for cargo that calls it wherever cargo is
# called, but the cargo command won't be called in the shell to build dependencies...
#
for crate in $crates

	pushd $crate

		cargo > /dev/null

	popd

end

if test (count $argv) -eq 0   ; check; exit      ; end
if test $argv[1] = "check"    ; check            ; end
if test $argv[1] = "build"    ; build            ; end
if test $argv[1] = "run"      ; run              ; end
if test $argv[1] = "buildrel" ; build  --release ; end
if test $argv[1] = "runrel"   ; run    --release ; end
