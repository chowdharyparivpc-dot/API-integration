# Deployment Guide

## Quick Start - Local Testing

```bash
# Activate virtual environment
.\env\Scripts\Activate.ps1

# Install dependencies
pip install -r requirements.txt

# Run Flask app
python app.py
```

Visit: http://127.0.0.1:5000

---

## Deployment to Render.com (Recommended - Free Tier)

### Prerequisites
- GitHub account with this repository
- Render.com account (free)

### Step-by-Step Setup:

1. **Prepare Repository**
   - Push code to GitHub
   - Ensure `render.yaml` is in the root directory
   - Verify `requirements.txt` includes: Flask, Flask-SQLAlchemy, Werkzeug, gunicorn

2. **Create Render Service**
   - Go to https://dashboard.render.com
   - Click "New" → "Web Service"
   - Select "Connect a repository" or "Deploy existing code"
   - Choose this GitHub repository

3. **Configure Service**
   - **Name:** elite-eats (or your preferred name)
   - **Runtime:** Python 3.11
   - **Build Command:** `pip install -r requirements.txt`
   - **Start Command:** `gunicorn app:app`
   - **Free Plan:** Select "Free" tier

4. **Set Environment Variables**
   - Click "Environment" tab
   - Add variable:
     - Key: `SECRET_KEY`
     - Value: Leave empty (Render will auto-generate)
   - Add if needed:
     - Key: `DATABASE_URL`
     - Value: Will use SQLite by default (stored in /data volume)

5. **Deploy**
   - Click "Deploy"
   - Wait for build to complete (2-3 minutes)
   - Check logs for any errors
   - Your app will be available at: `https://elite-eats.onrender.com`

### After Deployment
- Visit your live app URL
- Test all features: login, search, time range filter, cart
- Create a test user account
- Verify filters are working correctly

### Troubleshooting

**Build Fails:**
- Check logs in Render dashboard
- Verify all dependencies are in `requirements.txt`
- Ensure Python version compatibility

**App Crashes:**
- Check "Logs" tab in Render dashboard
- Verify environment variables are set
- Check that Flask can connect to database

**Database Issues:**
- First deploy creates SQLite database
- Persistent data stored in `/data` volume on Render free tier
- For production, upgrade to paid plan with PostgreSQL

---

## Alternative: Heroku Deployment (Paid)

**Note:** Heroku free tier has ended. Paid plans start at $7/month.

```bash
# Install Heroku CLI from: https://devcenter.heroku.com/articles/heroku-cli
heroku login
heroku create your-app-name
git push heroku main
```

---

## Environment Variables Reference

| Variable | Purpose | Required |
|----------|---------|----------|
| `SECRET_KEY` | Session encryption key | Auto-generated on Render |
| `DATABASE_URL` | Database connection string | Optional (uses SQLite) |
| `PYTHON_VERSION` | Python version | 3.11.9 |
| `PORT` | Server port | Auto-set by Render (5000) |

---

## Features Checklist

After deployment, verify these features work:

- ✅ User registration and login
- ✅ Recipe search and filtering
- ✅ **Time range filter** (fixed in this update)
- ✅ Category filtering
- ✅ Rating filter
- ✅ Favorites system
- ✅ Shopping cart
- ✅ Order management
- ✅ User profile page

---

## Performance Notes

- Free tier on Render may have cold starts (first request takes 15-30 seconds)
- Database is SQLite with 512MB storage limit
- For production traffic, upgrade to paid tier with auto-scaling


The `Procfile` is already configured.

---

### Option 3: Railway.app (Free Tier)

**Setup:**
1. Go to [Railway.app](https://railway.app)
2. Sign up with GitHub
3. Create new project from GitHub
4. Select this repository
5. Add `requirements.txt` as dependency
6. Deploy automatically on push

---

### Option 4: Replit

**Setup:**
1. Go to [Replit.com](https://replit.com)
2. Create new Repl from GitHub
3. Select this repository
4. Run command: `python app.py`

---

## GitHub Actions CI/CD

The `.github/workflows/deploy.yml` workflow:
- Runs on every push to `main` branch
- Verifies Python syntax
- Tests dependencies
- Prepares for deployment

**View workflow status:**
1. Go to GitHub repository
2. Click **Actions** tab
3. See deployment status

---

## Environment Variables

Create a `.env` file locally (see `.env.example`):

```bash
FLASK_ENV=production
SECRET_KEY=your-super-secret-key
```

**For production (Render/Heroku):**
- Set environment variables in platform dashboard
- Never commit `.env` file to git
- `.gitignore` already excludes `.env`

---

## Database Setup

On Render/production:
1. App initializes SQLite database automatically
2. First user creation endpoint: `/init-test-user`
3. Database persists in Render's disk storage

**Test user credentials:**
- Email: `test@example.com`
- Password: `password123`

---

## Monitoring & Logs

### Render.com:
- Logs visible in Render dashboard
- Real-time monitoring
- Performance metrics

### GitHub Actions:
- View workflow logs in Actions tab
- See build/deployment errors

---

## Troubleshooting

**Port Already in Use:**
```bash
# Change port in app.py or use:
PORT=8000 python app.py
```

**Module Not Found:**
```bash
pip install -r requirements.txt
```

**Database Errors:**
```bash
# Reset database
rm instance/app.db
python app.py  # Recreates database
```

**Static Files Not Loading:**
- Ensure `templates/` and `static/` are in git
- Check file permissions

---

## Performance Optimization

- Use `gunicorn` with workers: `gunicorn -w 4 app:app`
- Enable caching headers in production
- Use CDN for static assets
- Monitor database performance

---

## Security Checklist

- [ ] Change `SECRET_KEY` in production
- [ ] Set `FLASK_ENV=production`
- [ ] Use HTTPS (automatic on Render)
- [ ] Enable CORS if needed
- [ ] Validate user input
- [ ] Keep dependencies updated

---

## Support

For issues:
1. Check GitHub Issues
2. Review error logs
3. Test locally first
4. Update all dependencies

