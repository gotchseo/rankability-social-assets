# Rankability LinkedIn carousel: What 48 months of search demand shows (version 2)

Asana card 1220389363856782. Six slides, 1080 x 1350 px. Designed against the
marketing repo `gotchseo/Rankability` at commit `65bd74f` (DESIGN.md,
docs/brand/art-direction.md, the rankability-art-direction skill), then revised to
the owner's taste direction: navy-led, calm regular-weight headlines, fine tick
marks, a lot of empty space, one blue accent per slide.

## Files

- `../carousel.pdf`: all six slides, the file to upload to LinkedIn as a document.
- `../slide-1.png` to `../slide-6.png`: 1080 x 1350 exports. `render.sh` writes new exports into this folder; move them up one level to publish.
- `carousel.html` + `carousel.css`: the editable source. One `<section class="slide">` per slide.
- `assets/`: the Rankability wordmark, copied from the repo's `public/assets/`.
- `render.sh`: re-renders the PNGs and the PDF with headless Google Chrome.

## Fonts

The slides use Graphik Regular and Medium. Graphik is licensed, so the font files
are not in this folder. They live in the repo at `public/fonts/`.

- To re-render: `./render.sh /path/to/Rankability/public/fonts`
  The script links the fonts into a temporary build folder, checks that both faces
  loaded, and stops without exporting if they did not.
- To open `carousel.html` in a browser with the real font: put a folder (or a symlink)
  named `fonts` next to `carousel.css` containing `Graphik-Regular.woff2` and
  `Graphik-Medium.woff2`. A machine with Graphik installed also works. Without either,
  the page shows a red "Graphik did not load" banner and falls back to a system font;
  that is not a final render.
- Remove any `fonts` folder or symlink before sharing this folder.

`carousel.html?slide=3` shows a single slide flush to the window (what the PNG export uses).

## Editing rules

- The headline and supporting line on each slide are the approved copy from the card,
  word for word. Only line breaks, hierarchy and typographic apostrophes were chosen.
- Headlines are weight 400. DESIGN.md sets display type at 700; the lighter weight is
  the owner's direction for social graphics.
- Colors: navy `#0B2A66` surface, blue `#1E63FF` accent, white text. Three values are
  not DESIGN.md tokens: `#BBD1FF` (secondary text on navy, from
  `scripts/generate-saas-aeo-social-image.mjs`) and the two gradient ends `#0C2E6E`
  and `#071B45`, a slightly lighter and a darker navy used only for depth.
- Every mark is counted or measured to scale from a figure on the card:
  48 ticks for 48 months; 50 ticks for the 2025 peak with 15 (30%) ghosted;
  lines of 21.7 and 3.6 units; tick rows of 44 and 20 (2.2 to 1).
  Nothing else is plotted. Chart labels and the source captions on slides 2 to 4 are
  not card copy; they use only words and figures that are on the card.
- One blue mark per slide. Do not colour phrases or fill bars with it.
