# Deployment Checklist

## Pre-Deployment (Local Verification)

- [ ] All time range filter changes applied to `index.html`
- [ ] `requirements.txt` contains all dependencies:
  - [ ] Flask==3.0.0
  - [ ] Flask-SQLAlchemy==3.1.1
  - [ ] Werkzeug==3.0.1
  - [ ] gunicorn==22.0.0
  - [ ] requests
- [ ] `render.yaml` is configured
- [ ] `Procfile` exists with correct content
- [ ] `.gitignore` excludes `env/`, `*.db`, `__pycache__/`
- [ ] Code is committed to GitHub repository

## Local Testing

```bash
# Test locally before deploying
.\env\Scripts\Activate.ps1
python app.py

# Visit http://127.0.0.1:5000
# Test: login, search, time range filter, cart, favorites
```

- [ ] Local server runs without errors
- [ ] Time range filter shows min/max placeholders
- [ ] Time range filtering works in real-time as you type
- [ ] Categories filter works
- [ ] Search functionality works
- [ ] Cart and favorites work
- [ ] Login/registration works

## Render.com Deployment Steps

### Account Setup
- [ ] Create GitHub account (if not already done)
- [ ] Push code to GitHub repository
- [ ] Create Render.com account (https://render.com)

### Service Configuration
- [ ] Log in to Render.com dashboard
- [ ] Click "New" → "Web Service"
- [ ] Select GitHub repository
- [ ] Set name: `elite-eats`
- [ ] Set runtime: `Python 3.11`
- [ ] Set build command: `pip install -r requirements.txt`
- [ ] Set start command: `gunicorn app:app`
- [ ] Select "Free" tier
- [ ] Environment variables:
  - [ ] SECRET_KEY (let Render auto-generate)
  - [ ] PYTHON_VERSION: 3.11.9

### Deployment
- [ ] Click "Deploy" button
- [ ] Monitor build progress (2-3 minutes)
- [ ] Check for build errors in logs
- [ ] Wait for "Live" status
- [ ] Note the deployment URL (https://elite-eats.onrender.com)

## Post-Deployment Testing

- [ ] Visit deployed app URL in browser
- [ ] Test user registration with new email
- [ ] Test login with created account
- [ ] Test search functionality
- [ ] **Test time range filter:**
  - [ ] Min placeholder shows correct range
  - [ ] Max placeholder shows correct range
  - [ ] Enter min time value → filters update
  - [ ] Enter max time value → filters update
  - [ ] Clear inputs → shows all recipes
- [ ] Test category filter
- [ ] Test rating filter
- [ ] Test favorites (heart icon)
- [ ] Test cart (add/remove/quantity)
- [ ] Test reset button clears all filters

## Common Issues & Solutions

### Build Fails
```
Error: ModuleNotFoundError
→ Add missing module to requirements.txt
→ Run locally: pip install -r requirements.txt
→ Verify all imports in app.py
```

### App Won't Start
```
Error: Address already in use
→ Check Render logs for actual error
→ Verify PORT environment variable if needed
```

### Database Issues
```
SQLite database not persisting
→ Render free tier stores in /data volume
→ Logs: check if app.db is created
→ For production: upgrade to paid PostgreSQL
```

### Filters Not Working
```
Time range shows old values
→ Clear browser cache (Ctrl+Shift+Del)
→ Try incognito/private window
→ Check browser console for JS errors
```

## Rollback Plan (If Issues Occur)

1. Go to Render dashboard
2. Click on the service
3. Go to "Deploys" tab
4. Click previous working deployment
5. Click "Redeploy" to rollback

## Monitoring After Deployment

- [ ] Check Render dashboard regularly
- [ ] Monitor "Logs" tab for errors
- [ ] Check "Metrics" tab for performance
- [ ] Set up alerts for crashes (if on paid tier)

## Next Steps

- [ ] Share deployment URL with users
- [ ] Test with real user traffic
- [ ] Monitor performance
- [ ] Consider upgrading to paid tier if needed

---

**Deployment Date:** _______________  
**Deployed By:** _______________  
**App URL:** _______________
