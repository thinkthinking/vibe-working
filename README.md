# vibe-working

vibe-working-now

## Project Initialization

### Prerequisites

**node.js & npm & pnpm install**

```bash
## See Details in https://nodejs.org/en/download/current
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 25

# Verify the Node.js version:
node -v # Should print "v25.2.1".

# Install Corepack:
npm install -g corepack

# Download and install pnpm:
corepack enable pnpm

# Verify pnpm version:
pnpm -v

```

**uv install**

```bash
# macOS/Linux
curl -LsSf https://astral.sh/uv/install.sh | sh
```

**Python install**

```bash
# Create Python virtual environment with uv
uv venv .
```

### Project Initialization

**Next.js 16**

```bash
pnpm create next-app@latest .
```

**shadcn/ui**

```bash
# Initialize shadcn/ui in your Next.js project
pnpm dlx shadcn@latest init

# Add components as needed
pnpm dlx shadcn@latest add button
pnpm dlx shadcn@latest add card
```

**Vercel AI SDK**

```bash
# Install AI SDK core packages
pnpm add ai @ai-sdk/openai @ai-sdk/react zod

```

### Install Dependencies

```bash
# Install Node.js dependencies
pnpm install

# Install Python dependencies (if you have a requirements.txt or pyproject.toml)
uv sync
```