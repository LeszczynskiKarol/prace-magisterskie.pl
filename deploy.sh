#!/bin/bash
# Deploy script for prace-magisterskie.pl

S3_BUCKET="www.prace-magisterskie.pl"
CLOUDFRONT_ID="C07079222F4J04XM58T0E"

echo "🚀 Building prace-magisterskie.pl..."
cd /d/prace-magisterskie.pl
npm run build

echo "📤 Uploading to S3..."
aws s3 sync dist/ s3://${S3_BUCKET} --delete

echo "🔄 Invalidating CloudFront cache..."
aws cloudfront create-invalidation --distribution-id ${CLOUDFRONT_ID} --paths "/*"

echo "✅ Deployed to https://www.prace-magisterskie.pl"