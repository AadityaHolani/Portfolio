# Portfolio

Personal portfolio site for **Aaditya Holani**, supply chain consultant at OMP in Atlanta. Live at **[aadityaholani.com](https://aadityaholani.com)**.

Static HTML and CSS with a little vanilla JavaScript: no build step and no dependencies.

## What's here

| Path | What it is |
| --- | --- |
| `site/` | What gets hosted: the live page plus the shared images, `robots.txt` and `sitemap.xml`. Its `index.html` is a copy of one version below. |
| `versions/chapters/` | Muted colour chapters with still-life photography, counting figures and a results ticker. Live now. |
| `versions/label/` | The career as shipping paperwork: a shipping-label hero (Nagpur to Atlanta), job folders, a packing slip that adds up the results, a "Hire me for" bill of lading, a live service-level calculator, a cover letter, and the back of the label as the footer. |
| `versions/route/` | The career drawn as a supply route in a sticky sidebar. |
| `scripts/use-version.sh` | Chooses which version `site/` hosts. |

The still-life photographs are illustrative and were generated with Figma AI.

## Choose which version is live

```sh
scripts/use-version.sh            # list versions; the live one is starred
scripts/use-version.sh label      # host versions/label
```

Then commit and push to `main`; Cloudflare Pages publishes it. To go back, run the script with the old name.

**Edit a design in its own folder** (`versions/<name>/index.html`), then run the script again to copy it into `site/`. The script refuses to switch if `site/index.html` has edits that never made it back to its version folder, so nothing is lost; copy them back first, or pass `-f` to discard them.

**Add a version:** make `versions/<name>/index.html`, keep `<meta name="portfolio-version" content="<name>">` in its head, and reference images as `img/...` so they resolve from `site/`.

## Preview locally

Switch to the version you want to see, then serve the folder:

```sh
scripts/use-version.sh label
npx serve site
```

## Deploy on Cloudflare Pages

**Upload by hand:** Cloudflare dashboard, then Workers & Pages, then your project, then **Create deployment**, and upload the contents of `site/` (or a zip with `index.html` at its top level).

**Deploy from this repo:** in Workers & Pages, choose **Create**, then **Pages**, then **Connect to Git**, and pick this repository. Leave the build command empty and set the build output directory to `site`. Every push to `main` then goes live.

**From a terminal:**

```sh
npx wrangler pages deploy site --project-name=<your-project>
```
