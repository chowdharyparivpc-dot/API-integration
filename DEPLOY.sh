#!/bin/bash
# Quick Deploy Script to Render.com
# Usage: Follow the steps in the comment blocks below

# Step 1: Ensure code is committed to GitHub
echo "📦 Pre-deployment checklist:"
echo ""
echo "1. ✅ Verify local changes are working:"
echo "   - Run: python app.py"
echo "   - Test: http://127.0.0.1:5000"
echo "   - Test time range filter, search, and cart"
echo ""

echo "2. ✅ Commit changes to GitHub:"
echo "   git add ."
echo "   git commit -m 'Fix time range filter and prepare for deployment'"
echo "   git push origin main"
echo ""

echo "3. ✅ Go to Render.com Dashboard:"
echo "   https://dashboard.render.com"
echo ""

echo "4. ✅ Create New Web Service:"
echo "   - Click 'New' → 'Web Service'"
echo "   - Connect GitHub repository"
echo "   - Select this repository"
echo ""

echo "5. ✅ Configure Service Details:"
echo "   - Name: elite-eats"
echo "   - Runtime: Python 3.11"
echo "   - Build Command: pip install -r requirements.txt"
echo "   - Start Command: gunicorn app:app"
echo "   - Plan: Free"
echo ""

echo "6. ✅ Set Environment Variables:"
echo "   - SECRET_KEY (leave empty for auto-generation)"
echo ""

echo "7. ✅ Click Deploy"
echo ""

echo "8. ✅ Wait for deployment (2-3 minutes)"
echo "   - Monitor the build process"
echo "   - Once 'Live', your app is deployed!"
echo ""

echo "9. ✅ Test Deployed App:"
echo "   - Visit your app URL"
echo "   - Test all features"
echo "   - Verify time range filter works"
echo ""

echo "🚀 Deployment complete!"
