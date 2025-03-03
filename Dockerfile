FROM rocm/dev-ubuntu-22.04:6.2.4

LABEL Author="j.caley@unsw.edu.au" \
      Version="0.1.3" \
      description="Image containing all software requirements to run Boltz1"

COPY environment_daily_rocm.yaml .

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y \
    wget \
    git \
    build-essential && \
    wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh" && \
    bash Miniforge3-$(uname)-$(uname -m).sh -b -p /opt/miniforge && \
    rm Miniforge3-$(uname)-$(uname -m).sh && \
    export PATH="/opt/miniforge/bin:$PATH" && \
    mamba env create --file=environment_daily_rocm.yaml && \
    apt autoremove -y && apt remove --purge -y wget git && apt clean -y && \
    rm -rf /var/lib/apt/lists/* /root/.cache && \
    mamba clean --all --force-pkgs-dirs -y

ENV PATH="/opt/miniforge/bin:$PATH"

ENTRYPOINT ["mamba", "run", "--name", "boltz"]

CMD ["bash"]

