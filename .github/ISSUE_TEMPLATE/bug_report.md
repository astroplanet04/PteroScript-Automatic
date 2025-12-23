---
name: "🐞 Bug Report"
about: "Report a glitch or error in the script"
title: "[BUG] - Briefly describe the issue"
labels: bug, needs-triage
---

**Describe the bug**
A clear and concise description of what the bug is.

**System Information:**
- OS: (e.g., Ubuntu 22.04)
- Script Version: (e.g., 2.1.0)
- Virtualization: (KVM, Dedicated, etc.)

**Error Logs**
If applicable, paste the content of `/var/log/ptero_pro.log` here:
```bash
# Paste logs here
```
To Reproduce
Steps to reproduce the behavior:
Run option '...'
Enter '...'
See error

---

### 2. Pull Request Template (Per chi vuole aiutarti)
Se qualcuno vuole modificare il tuo codice, deve seguire questo schema.
Crea il file `.github/pull_request_template.md`:

```markdown
## Description
Describe the changes you've made. Why is this PR necessary?

## Type of Change
- [ ] 🚀 New Feature
- [ ] 🐛 Bug Fix
- [ ] 🧹 Code Cleanup / Refactoring
- [ ] 📝 Documentation Update

## Checklist
- [ ] My code follows the style guidelines of this project.
- [ ] I have tested my changes on a fresh Ubuntu/Debian install.
- [ ] I have updated the README if necessary.
