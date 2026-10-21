# Portfolio

Personal portfolio site for **Aaditya Holani**, supply chain consultant at OMP in Atlanta. Live at **[aadityaholani.com](https://aadityaholani.com)**.

Static HTML and CSS with a little vanilla JavaScript: no build step and no dependencies.

## What's here

| Path | What it is |
| --- | --- |
| `site/` | The live site, built as shipping paperwork: the hero is a shipping label (Nagpur to Atlanta), each job is a filed folder, the dollar results add up on a packing slip, a pick ticket prices a service level live, and the footer is the back of the label. |
| `versions/route/` | An alternative design: the career drawn as a supply route in a sticky sidebar. |

The still-life photographs are illustrative and were generated with Figma AI.

## Preview locally

Open `site/index.html` in a browser, or serve the folder:

```sh
npx serve site
```

## Deploy on Cloudflare Pages

**Upload by hand:** Cloudflare dashboard, then Workers & Pages, then your project, then **Create deployment**, and upload the contents of `site/` (or a zip with `index.html` at its top level).

**Deploy from this repo:** in Workers & Pages, choose **Create**, then **Pages**, then **Connect to Git**, and pick this repository. Leave the build command empty and set the build output directory to `site`. Every push to `main` then goes live.

**From a terminal:**

```sh
npx wrangler pages deploy site --project-name=<your-project>
```
