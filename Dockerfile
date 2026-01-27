FROM node:20.9.0

# Instala dependências
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gnupg \
    ca-certificates \
    fonts-liberation \
    libasound2 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libxss1 \
    libgtk-3-0 \
    libnss3 \
    libxshmfence1 \
    libxext6 \
    libx11-6 \
    libxtst6 \
    libxrender1 \
    libxcb1 \
    libxfixes3 \
    libxau6 \
    libxdmcp6 \
    libxinerama1 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libgbm1 \
    xvfb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instala o Chrome via repositório (mais seguro)
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable
