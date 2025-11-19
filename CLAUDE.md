# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a hybrid full-stack scaffold integrating **Next.js 16** (frontend/API) and **Python** (backend scripts/analysis), managed by `uv`.

- **Frontend**: Next.js 16 (App Router), React 19, Tailwind CSS 4.
- **UI Components**: shadcn/ui (Radix UI + Tailwind).
- **AI**: Vercel AI SDK (`ai`, `@ai-sdk/openai`).
- **Backend/Scripts**: Python 3.13+, managed by `uv`.
- **Package Managers**: `pnpm` (Node.js), `uv` (Python).

## Build & Run Commands

### Node.js / Next.js
- **Dev Server**: `pnpm dev` (Runs at http://localhost:3000)
- **Build**: `pnpm build`
- **Start Production**: `pnpm start`
- **Lint**: `pnpm lint`
- **Install Dependencies**: `pnpm install`
- **Add UI Component**: `pnpm dlx shadcn@latest add [component-name]`

### Python
- **Install Dependencies**: `uv sync`
- **Run Script**: `uv run main.py` (or `source .venv/bin/activate && python main.py`)
- **Add Package**: `uv add [package]`

## Architecture & Structure

- **Hybrid Root**: Both `package.json` and `pyproject.toml` reside in the root.
- **App Router**: `src/app/` contains Next.js routes and pages.
- **Components**: `src/components/` (implied) for React components.
- **Styles**: Tailwind v4 configuration is often in CSS files or inline, utilizing `@tailwindcss/postcss`.
- **MCP Servers**: configured in `.mcp.json` (next-devtools, context7).

## Development Guidelines

- **Mixed Environment**: Ensure `.gitignore` handles both Node (`node_modules`, `.next`) and Python (`.venv`, `__pycache__`) artifacts.
- **Tailwind v4**: Uses the new engine; configuration might differ from v3 (check `src/app/globals.css` or `postcss.config.mjs`).
- **React 19**: Be aware of new hooks and patterns (e.g., `use`, Server Actions).
