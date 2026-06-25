#!/bin/bash
# סבב 1 — commit לכל עבודת הביסוס/סיווג/ניקוי/תמונות.
# הרצה: לחיצה כפולה, או בטרמינל: bash commit-round1.command
cd "$(dirname "$0")" || exit 1

echo "מסיר נעילת git ישנה (אם קיימת)…"
rm -f .git/index.lock

echo "מוסיף קבצים…"
git add build.mjs maq-app.v5.js maq-system.html maq-system-v5.html \
        bank-all.json build/bank-patch-compact.json \
        catalog-regrounding-report.html citation-fix-report.html image-verify-2025.html \
        .gitignore

git commit -m "Round 1: reground Gabbe past-exam citations, fix chapter classification, strip leaked reference markers, embed 2025 figures

- Citations: 308/351 Gabbe past-exam questions regrounded to Gabbe 9th ed. (real chapter/page + verbatim anchor_sentence)
- Classification: 203 questions reclassified to correct chapter (incl. unclassified ch0)
- Reference cleaning: 80 leaked bibliography markers stripped (content numbers preserved)
- Images: 19 figures from the 2025 official album embedded (base64)
- 8 key conflicts + 33 dilemmas routed to human review
- Delivery: version-guarded BANK_PATCH seed-on-load (v2026-06-25b) + rebuilt maq-system.html"

echo ""
echo "בוצע. היומן האחרון:"
git log --oneline -3
echo ""
read -p "להקיש Enter לסגירה…"
