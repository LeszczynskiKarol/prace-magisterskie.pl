#!/bin/bash
S3_BUCKET="www.prace-magisterskie.pl"
CLOUDFRONT_ID="E42YH6IKMW3J7"  # <-- To jest poprawne ID dystrybucji www

cd /d/prace-magisterskie.pl

echo "📦 Pushing to GitHub..."
git add .
git commit -m "git push from local"
git push origin main

if [ $? -ne 0 ]; then
  echo "❌ Git push failed!"
  exit 1
fi

npm run build
aws s3 sync dist/ s3://${S3_BUCKET} --delete
aws cloudfront create-invalidation --distribution-id ${CLOUDFRONT_ID} --paths "/*"
echo "✅ Deployed to https://www.prace-magisterskie.pl"