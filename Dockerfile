FROM dolphm/ubuntu-latest-rust-nightly:latest

RUN ~/.cargo/bin/rustup default nightly

RUN apt-get -y update && apt-get install -y g++ make git
RUN ~/.cargo/bin/cargo install cargo-fuzz

# Cloning may fail, update the repo anyway
CMD git clone https://github.com/abonander/multipart; \
	cd multipart && \
	git pull && \	
	PATH=~/.cargo/bin:$PATH ./fuzz_server.sh
