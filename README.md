# Yogaganapathi Terminal Portfolio

A clean, interactive developer portfolio built as a terminal-inspired webpage with a resume showcase and one-click PDF download.

## 🚀 Features

- Terminal-style CLI experience with typed commands and command history
- Two-column responsive layout:
  - Left: resume image + download button
  - Right: interactive terminal panel
- Smooth typing output and auto-scroll for command history
- Mobile-friendly responsive UI

## 📁 Project Files

- `index.html` - main page structure
- `styles.css` - visual layout, terminal shell styling, responsive behavior
- `script.js` - terminal command engine, prompt behavior, output rendering
- `resume.jpg` / `yogaganapathi_resume.png` - resume preview image
- `Yogaganapathi_DevOps_SRE.pdf` - downloadable resume file (PDF)

## 🛠️ Setup

1. Clone or download the project files.
2. Open the folder in VS Code.
3. Start a local server (recommended):

```bash
cd "d:\Yogi Personal\Projects\Yogi_portfolio\Yogi_portfolio"
python -m http.server 8000
```

4. Open `http://localhost:8000` in your browser.

## 🧭 Usage

Type commands into the terminal input and press Enter. Available commands:

- `help` - show available commands
- `profile` - show a short summary
- `skills` - list technical skills
- `experience` - show experience overview
- `experience tcs` - TCS responsibilities
- `experience trimble` - Trimble responsibilities
- `social` - social links
- `clear` or `cls` - clear terminal output

## 🎨 Customize

- Replace the preview image file with your own resume screenshot (`resume.jpg` or `yogaganapathi_resume.png`).
- Replace `Yogaganapathi_DevOps_SRE.pdf` with your actual PDF resume and keep the download link name if you like.
- Edit `commands` in `script.js` to add/remove or update outputs.
- Update styles in `styles.css` to match your branding colors and typography.

## 💡 Notes

- The terminal is designed to stay in a fixed-height container with internal scrolling, so the page layout stays stable.
- Use arrow keys Up/Down to navigate previous commands in history.

---

Made with HTML, CSS, and JavaScript for an interactive portfolio experience.
