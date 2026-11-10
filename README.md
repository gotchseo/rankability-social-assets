# Rankability social assets

Finished visuals for Rankability's social posts, served at a public address so a
scheduler can fetch them. This repository is public and is published with GitHub
Pages: **a file is public the moment it is pushed to `main`.**

## Addresses

A file at `2026/ai-seo-predictions/search-demand-carousel/carousel.pdf` is served at

```
https://gotchseo.github.io/rankability-social-assets/2026/ai-seo-predictions/search-demand-carousel/carousel.pdf
```

Use that address, not a `github.com` or `raw.githubusercontent.com` link. Pages
serves each file directly with its real file type.

## Layout

```
<year>/<pillar>/<card>/        exports: the files a post uses
<year>/<pillar>/<card>/source/ the editable source and how to re-render it
```

Name the card folder after the content card, in lowercase with hyphens. A LinkedIn
carousel needs two addresses: the PDF, and an image to use as its thumbnail
(normally `slide-1.png`).

## Rules

- Only add exports that have passed design review for an approved card.
- Never rename, move or delete a file that a scheduled or published post uses.
  The scheduler fetches the file when the post goes out, which can be days later.
  To change a visual, add a new file and point the post at it.
- No fonts. Graphik is licensed; the source folders explain how to load it from
  the private website repository when re-rendering.
- No other company's images, logos or reference material.
- No credentials, customer data, unpublished figures or internal documents.
- After pushing, open the Pages address in a private browser window and confirm
  the file loads without a sign-in before giving the address to anyone.
