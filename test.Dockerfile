# Use playwright image as a base

FROM mcr.microsoft.com/playwright:v1.48.0-jammy-arm64 as playwright


WORKDIR /b2b


COPY ./packages /b2b/packages
COPY ./package.json /b2b/package.json
COPY ./scripts /b2b/scripts
COPY ./DEV-GUIDELINES.md /b2b
COPY ./CHANGELOG.md /b2b


# Install chromium-browser
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get update && \
    apt-get install -y chromium-browser



WORKDIR /b2b
RUN npm i

WORKDIR /b2b/packages/core-components
