# Portfolio Redesign — Design Spec

**Date:** 2026-06-15
**Project:** gh-portfolio (Mason McElroy's casino game prototype portfolio)

---

## Brief

A portfolio of playable casino game prototypes targeting hiring managers and design leads at casino companies (Scientific Games, Aristocrat, IGT-tier). The goal is to demonstrate a rare combination: expert casino game designer, mathematician, and rapid prototyper — all three in one person. The prototyping ability is the key differentiator; most candidates at this level can do one or two, not all three.

---

## Design Direction

**Charcoal + Pure White — Technical Builder**

Dark, restrained, precise. The design language of an engineering bench, not a casino floor. No color accent. The colorful game thumbnails are the only vivid elements on the page — the contrast between austere near-black and vivid game screenshots is the signature of the design. Restraint makes the work feel confident.

---

## Token System

### Color
| Name | Value | Usage |
|---|---|---|
| `--bg` | `#111214` | Page background |
| `--surface` | `#18191C` | Card hover state |
| `--border` | `rgba(255,255,255,0.08)` | All dividers and borders |
| `--border-strong` | `rgba(255,255,255,0.15)` | Hover border state |
| `--text` | `#ffffff` | Primary text (headings, CTAs) |
| `--text-mid` | `rgba(255,255,255,0.50)` | Body text, descriptions |
| `--text-dim` | `rgba(255,255,255,0.25)` | Labels, metadata, dates |

No color accent. These seven values cover the entire design.

### Typography
- **Display:** Barlow Condensed ExtraBold (800) — hero name, game titles, stat numbers. Compressed and industrial. Loaded from Google Fonts.
- **Body:** Inter (400/500/600) — descriptions, tags, nav buttons, all prose. Loaded from Google Fonts.

**Type scale:**
| Role | Size | Weight | Case |
|---|---|---|---|
| Hero name | clamp(3.5rem, 8vw, 6rem) | 800 Barlow Condensed | UPPERCASE |
| Game title | 1.4rem | 800 Barlow Condensed | UPPERCASE |
| Stat number | 2rem | 800 Barlow Condensed | — |
| Body | 0.78–0.95rem | 400 Inter | Sentence |
| Label/tag | 0.55–0.65rem | 600 Inter | UPPERCASE + tracking |

### Layout
- Max content width: 900px
- Side padding: 2.5rem (desktop), 1rem (mobile)
- No border-radius anywhere — square corners reinforce the technical aesthetic

---

## Page Structure

### Navigation
Fixed top bar. Left: "Solcalc" logotype in Barlow Condensed, muted. Right: "About" button + "LinkedIn ↗" button. Both buttons are border-only (no fill), `--border` at rest, `--border-strong` on hover. No LinkedIn blue — unified white-on-dark palette.

### Hero
Left-aligned, max-width 900px. Structure:
1. Small label: `PROTOTYPE PORTFOLIO` — `--text-dim`, tight uppercase tracking
2. Large stacked name: `MASON / McELROY` in Barlow Condensed ExtraBold
3. Thin 40px white rule (2px height)
4. Tagline: "Casino game designer and mathematician. I design the mechanics, model the math, and build working playable prototypes. All three." — `--text-mid`, Inter regular
5. Stats row: three items — **11 Playable Prototypes**, **10+ Years Experience**, **Real Game Math**. Numbers in Barlow Condensed, labels in tiny uppercase Inter.

The hero makes the differentiator explicit in copy rather than relying on design metaphor alone.

### Game List
Full-width below the hero, contained to 900px. Each game is a horizontal card:

```
┌─────────────────────────────────────────────────────┐
│  [4:3 thumbnail]  │  001 · June 2026                │
│                   │  GAME TITLE IN CAPS             │
│                   │  Description text here...       │
│                   │  [Slot] [Cluster Pays] [Hold]   │
│                   │  [PLAY GAME]        Prototype   │
└─────────────────────────────────────────────────────┘
```

- Thumbnail column: 260px, 4:3 aspect ratio, `--surface` background, `--border` right edge
- On card hover: `background` shifts to `--surface`, border steps to `--border-strong`, thumbnail brightens via `filter: brightness(1.1)`. No other motion.
- Sequential index (001, 002…) in `--text-dim` — earns its place because build order is real
- Mechanic tags: small uppercase Inter, `--border` border, `--text-dim` text. Examples: Slot, Cluster Pays, Hold & Spin, Community Bonus, Arcade, Skill, Blackjack, Video Poker.
- Play Game button: white fill, black text, no border-radius, Inter 600

### About Page
Remains in a modal (triggered from nav). Gets the same type system: Barlow Condensed for the name/headings, Inter for body. Headshot, bio, Notable Game Releases grid, Core Skills section. No style changes to structure.

---

## Signature Element

The colorful game thumbnails against near-black. Casino game screenshots are inherently vivid (Lucky Pharaoh's gold and sand tones, Triple Rocket Pots' reds and blues, Anubis's purples). With no competing color anywhere on the page, each thumbnail is a small burst of life in an otherwise austere design. The restraint of everything else is what makes this work.

---

## Motion

One interaction only: card hover brightens the thumbnail (`filter: brightness(1.1)`, `transition: 0.15s`) and steps up border opacity. No entrance animations, no scroll effects, no other movement.

---

## Responsive

- Below 768px: game card switches to single column (thumbnail stacked above info)
- Thumbnail stays 4:3 in both layouts
- Hero name scales down via `clamp()`
- Tags wrap naturally

---

## What Changes vs. Current Site

| Current | New |
|---|---|
| System font stack | Barlow Condensed + Inter |
| `#0a0a0a` generic dark | `#111214` with deliberate surface/border system |
| Hero: name + "Prototype Portfolio" heading | Hero: large stacked name + tagline that names the differentiator |
| Green `✓` bullet points | Tag system (mechanic labels per game) |
| LinkedIn blue in nav | Border-only button, unified palette |
| No visual hierarchy in metadata | `--text` / `--text-mid` / `--text-dim` three-tier system |

---

## Out of Scope

- No changes to game embed logic or modal JS behavior
- No changes to `games-config.js`
- No new pages
- About page content unchanged (structure and type treatment updated)

## In Scope (clarification)

Individual game card files (`games/*.html`) will be updated to replace bullet-point feature lists with the mechanic tag system, and to adopt the new card markup structure. Embed codes and modal behavior are untouched.
