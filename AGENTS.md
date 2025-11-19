# Repository Guidelines

## Project Structure & Module Organization
- Keep application logic in `src/` with feature-focused subfolders (e.g., `src/features/auth`, `src/lib/api`).
- Mirror business logic tests under `tests/` using the same folder names (`tests/features/auth/user.spec.ts`).
- Client-visible assets (static copy, icons, mock data) live in `assets/`; tooling scripts belong in `tools/`.
- Update `README.md` whenever new top-level directories appear and include short notes on their ownership.

## Build, Test, and Development Commands
- `npm install`: installs dependencies; run after any package update.
- `npm run dev`: starts the live-reload development server; use during feature work.
- `npm run build`: emits the production bundle into `dist/`; verify before release branches.
- `npm test`: executes the Jest suite once; combine with `npm test -- --watch` while iterating.
- `npm run lint`: enforces ESLint/Prettier checks; required before opening a PR.

## Coding Style & Naming Conventions
- TypeScript with 2-space indentation, trailing commas, and single quotes.
- Prefer functional, stateless modules; export default only for React components.
- Use descriptive file names (`user-profile-card.tsx`) and camelCase for variables/functions; KEEP_CONSTANTS in SCREAMING_SNAKE_CASE.
- Format via `npm run lint` (ESLint + Prettier). Do not hand-edit compiled output in `dist/`.

## Testing Guidelines
- Jest drives both unit and component tests. Follow `*.spec.ts` (sync) and `*.test.ts` (integration) naming.
- Aim for 80% line coverage per package (`npm test -- --coverage`).
- Mock external services with `msw` fixtures stored in `tests/mocks/`.
- Add reproduction tests for every bug fix before touching implementation.

## Commit & Pull Request Guidelines
- Use Conventional Commits (`feat: add dashboard filters`). One logical change per commit.
- Ensure every PR description answers: what/why/how-tested. Attach issue links and screenshots for UI work.
- Request review after CI passes and link to any follow-up tasks in the description.
- Squash commits on merge; leave a concise summary plus notable follow-up TODOs in the PR body.

## Security & Configuration Tips
- Never commit secrets; reference them via `.env.example` and document required keys in README.
- Validate third-party libraries for permissive licenses before adding them to `package.json`.
- For local debugging, prefer feature flags over temporary guards and remove them before release.
