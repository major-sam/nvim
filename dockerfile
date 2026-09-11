FROM anatolelucet/neovim:0.12.5-bookworm
RUN  apt update && \
    apt install -y \
      git \
      curl\
      ca-certificates\
      gpg\
      wget\
      lua5.4\
      luarocks\
      ripgrep\
      fd-find
#GH
RUN  mkdir -p -m 755 /etc/apt/keyrings \
	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	&& cat $out |  tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&&  chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&&  mkdir -p -m 755 /etc/apt/sources.list.d \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" |  tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&&  apt update \
	&&  apt install gh  -y
#NODE & NPM
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt install nodejs -y
#RUST
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -q -y
ENV PATH="/root/.cargo/bin:${PATH}"
#SHELL ["/bin/bash", "-c"]
