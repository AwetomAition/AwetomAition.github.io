# AwetomAItion blog

A blog about AI and automation, hosted free on **GitHub Pages**, built with
[Jekyll](https://jekyllrb.com) and the [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy) theme.

No domain to buy, no server to run: GitHub builds and hosts the site at
`https://awetomaition.github.io`.

---

## Publishing (one time)

### Option A — with Claude Code (easiest)
Unzip this folder on your laptop, open a terminal in it, start `claude`, and paste:

> Publish this folder as my GitHub Pages site. Make sure the GitHub CLI (`gh`) is installed and signed in
> as AwetomAition (install it and run `gh auth login` with me if needed), then run `./publish.sh` and tell me
> when https://awetomaition.github.io is live. If the build fails, read the Actions log and fix it.

### Option B — run the script yourself
1. Install the GitHub CLI: https://cli.github.com
2. Run `gh auth login` and sign in as **AwetomAition**.
3. In this folder, run `./publish.sh` (on Windows, use Git Bash).

The script creates the public repository `AwetomAition/AwetomAition.github.io`, uploads the files,
switches GitHub Pages to **GitHub Actions**, and waits for the first build. When it finishes, the site is
live at **https://awetomaition.github.io**.

### Option C — only the browser
1. Create a **public** repository named exactly `AwetomAition.github.io` at https://github.com/new.
2. Click **uploading an existing file** and drag in everything inside this folder, including the hidden
   `.github` folder (macOS Finder: `Cmd + Shift + .`; Windows: **View › Hidden items**). Commit.
3. **Settings › Pages › Source:** choose **GitHub Actions**.
4. **Actions** tab › **Build and Deploy** › **Run workflow**. After the green tick, the site is live.

---

## Writing a new post

1. Copy `_drafts/post-template.md` into the `_posts` folder.
2. Name it `YYYY-MM-DD-your-title.md`, e.g. `2026-12-01-my-first-agent.md`.
3. Fill in the title, categories and tags at the top, then write in Markdown.
4. Commit. The site rebuilds and the post appears within a few minutes.

You can do all of this in the GitHub website — **Add file › Create new file** in the `_posts` folder.

## What's where

| File / folder | What it does |
|---|---|
| `_config.yml` | Site name, tagline, your username, logo |
| `_posts/` | Published blog posts |
| `_drafts/` | Unpublished drafts and the post template |
| `_tabs/` | Sidebar pages: About, Resources, Categories, Tags, Archives |
| `assets/img/brand/` | AwetomAItion logo files (SVG + PNG) |
| `assets/img/favicons/` | Browser-tab icons |
| `.github/workflows/pages-deploy.yml` | Builds and publishes the site automatically |

## Using a different repository name

If you'd rather use a name like `blog`, the address becomes `https://awetomaition.github.io/blog`.
In `_config.yml`, set `baseurl: "/blog"` (keep `url` as `https://awetomaition.github.io`).

## Custom domain (optional, later)

If you buy a domain one day, add it under **Settings › Pages › Custom domain**
and update `url` in `_config.yml`. Until then, the free `github.io` address works fine.

## License

The Chirpy starter is released under the [MIT License](LICENSE).
