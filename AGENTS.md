# Repository Guidelines

## Project Structure & Module Organization
- **Root**: Hybrid environment with `package.json` (Node.js) and `pyproject.toml` (Python).
- **Frontend (`src/`)**:
  - `src/app/`: Next.js 16 App Router pages, layouts, and global styles.
  - `src/components/`: React components; `ui/` contains shadcn/ui primitives.
  - `src/lib/`: Shared utilities (e.g., `utils.ts`).
- **Backend/Scripts**: Python scripts (e.g., `main.py`) managed by `uv`.
- **Assets**: Static files live in `public/`.


## Build, Test, and Development Commands
### Node.js / Next.js
- `pnpm install`: Install Node dependencies.
- `pnpm dev`: Start the development server at http://localhost:3000.
- `pnpm build`: Compile the application for production.
- `pnpm lint`: Run ESLint to enforce code quality.
- `pnpm dlx shadcn@latest add [name]`: Add new UI components.

### Python
- `uv sync`: Install Python dependencies.
- `uv run main.py`: Execute the main Python entry point.
- `uv add [package]`: Add new Python packages.


## Coding Style & Naming Conventions
- **TypeScript/React**:
  - Use **React 19** patterns (Server Components, Server Actions, `use` hook).
  - Style with **Tailwind CSS v4** (configured in `globals.css` or inline).
  - Use functional components with named exports or default exports for pages.
  - File naming: camelCase for logic, kebab-case for utilities/components if preferred, or PascalCase for React components.
- **Python**: Follow PEP 8 standards; target Python 3.13+.
- **Linting**: Ensure `pnpm lint` passes before committing.


## Testing Guidelines
- Currently, no specific test runner is configured in `package.json`.
- If adding tests, prefer **Vitest** or **Jest** for the frontend and **pytest** for Python scripts.
- Ensure major features are verified manually if automated tests are absent.

## Commit & Pull Request Guidelines
- Write clear, descriptive commit messages (e.g., `feat: add user profile page`).
- Pull Requests should include a summary of changes and verify that `pnpm build` and `pnpm lint` pass.
- Update dependencies using `pnpm` for Node and `uv` for Python.

## Configuration & Environment
- **Secrets**: Use `.env.local` for local secrets; never commit sensitive keys.
- **Package Managers**: Strict use of `pnpm` (Node) and `uv` (Python).
- **Tools**: `uv` manages the Python environment/virtualenv automatically.

