# Proyecto Sarita

## Git / GitHub (importante)

Si `git push` devuelve:

```text
403: Permission to jonirast98-ui/sarita.git denied to jonirast98-ui
```

**NO reintentes el mismo push.** Usa este flujo:

```powershell
gh auth setup-git
git remote set-url origin https://github.com/jonirast98-ui/sarita.git
git push -u origin HEAD
```

O ejecuta el script del repo:

```powershell
powershell -ExecutionPolicy Bypass -File .\push.ps1
```

Nunca uses un proxy de git ni tokens inventados. La autenticación correcta es la de `gh` (GitHub CLI) del usuario `jonirast98-ui`.

## Repo

- Remoto: `https://github.com/jonirast98-ui/sarita.git`
- Pages: `https://jonirast98-ui.github.io/sarita/`
- Rama principal: `main`
