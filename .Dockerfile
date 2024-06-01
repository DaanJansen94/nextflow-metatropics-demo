FROM gitpod/workspace-full

# Set up environment variables
ENV TZ=Europe/London

# Disable Git LFS locking
RUN git config lfs.https://github.com/DaanJansen94/NF_pipeline.git/info/lfs.locksverify false

# Update package list and install dependencies
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata apt-utils build-essential libseccomp-dev pkg-config squashfs-tools cryptsetup wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Singularity
RUN wget https://github.com/apptainer/singularity/releases/download/v3.8.5/singularity-3.8.5.tar.gz \
    && tar -xzf singularity-3.8.5.tar.gz \
    && cd singularity-3.8.5 \
    && ./mconfig \
    && make -C builddir \
    && make -C builddir install \
    && cd .. \
    && rm -rf singularity-3.8.5 singularity-3.8.5.tar.gz

# Install Nextflow
RUN curl -s https://get.nextflow.io | bash \
    && mv nextflow /usr/local/bin/

# Set the working directory
WORKDIR /workspace
